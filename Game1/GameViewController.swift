//
//  GameViewController.swift
//  Game1
//
//  Created by 1234 on 04.03.2024.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var nextDigit: UILabel!
    @IBOutlet weak var statusLable: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    lazy var game = Game(countItems: buttons.count)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        
        
    }
    @IBAction func pressButton(_ sender: UIButton) {
        guard let buttonIndex = buttons.firstIndex(of: sender) else {return}
        game.check(index:buttonIndex)
        
        updateUI()
    }
    
    private func setupScreen(){
        
        for index in game.items.indices{
            buttons[index].setTitle(game.items[index].titel, for: .normal)
            buttons[index].isHidden = false
        }
        
        nextDigit.text = game.nextItem?.titel
    }
    
    private func updateUI() {
        for index in game.items.indices{
            buttons[index] .isHidden = game.items[index].isFound
        }
        nextDigit.text = game.nextItem?.titel
        if game.status == .win{
            statusLable.text = "You winner"
            statusLable.textColor = .green
            
        }
        }
    }

