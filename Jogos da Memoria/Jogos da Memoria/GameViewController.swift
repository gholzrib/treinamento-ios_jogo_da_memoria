//
//  ViewController.swift
//  Jogos da Memoria
//
//  Created by Gunther Ribak on 25/05/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    private let tryAgainSegue = "show-try-again"
    
    lazy var game = Game(numberOfPairOfCards: buttonsArray.count / 2)
    var cardTextProvider: CardTextProvider!

    var flipCount : Int = 0 {
        didSet {
            flipCountLabel.text = "flip:\(flipCount)"
        }
    }
    
    @IBOutlet var buttonsArray: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber : Int = buttonsArray.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            self.updateViewFromModel()
            flipCount += 1
        }
    }
    
    func updateViewFromModel() {
        for index in game.cards.indices {
            let button = self.buttonsArray[index]
            let card = self.game.cards[index]
            switch card.cardState {
            case CardState.back:
                button.backgroundColor = .orange
                button.setTitle(" ", for: .normal)
            case CardState.front:
                button.backgroundColor = .white
                //button.setTitle(self.cuteAnimalsEmojiProvider.text(for: card.identifier), for: .normal)
                button.setTitle(self.cardTextProvider.text(for: card.identifier), for: .normal)
            case CardState.matched:
                button.backgroundColor = .clear
                button.setTitle(" ", for: .normal)
            }
        }
        self.performSegue(withIdentifier: tryAgainSegue, sender: nil)
    }
    
}

