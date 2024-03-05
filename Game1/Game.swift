//
//  Game.swift
//  Game1
//
//  Created by 1234 on 04.03.2024.
//

import Foundation

enum StatusGame {
    case start
    case win
    case lose
}
class Game {
    
    struct Item{
        var titel:String
        var isFound:Bool = false
    }
    
    private let data = Array(1...99)
    
    var items:[Item] = []
    
    private var countItems:Int
    
    var nextItem:Item?
    
    var status:StatusGame = .start{
        didSet{
            if status != .start{
                stopGame()
            }
        }
    }
    
    private var timeForGame:Int{
        didSet {
            if timeForGame == 0 {
                status = .lose
            }
        }
    }
    private var timer:Timer?
    
    init(countItems:Int, time:Int){
        self.countItems = countItems
        self.timeForGame = time
        setupGame()
    }
    
    private func setupGame(){
        var digits = data.shuffled()
        
        while items.count < countItems{
            let item = Item(titel: String(digits.removeFirst()))
            items.append(item)
        }
        
        nextItem = items.shuffled().first
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (_) in
            self?.timeForGame -= 1
            
        })
        }
    
    func check(index:Int) {
        if items[index].titel == nextItem?.titel{
            items[index].isFound = true
            nextItem = items.shuffled().first(where: { (item) -> Bool in
                item .isFound == false
            })
        }
        
        if nextItem == nil{
            status = .win
            
            
        }
    }
    
    private func stopGame() {
        timer?.invalidate()
    }
}
