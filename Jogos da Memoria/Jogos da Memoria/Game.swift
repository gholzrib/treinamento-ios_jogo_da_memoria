//
//  Game.swift
//  Jogos da Memoria
//
//  Created by Gunther Ribak on 25/05/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class Game {
    
    var cards = [Card]()
    var indexOfOnlySelectedCard: Int?
    
    init(numberOfPairOfCards: Int) {
        for index in 0..<numberOfPairOfCards {
            let card = Card(identifier: index)
            self.cards += [card, card]
        }
        self.cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        if cards.indices.contains(index), cards[index].isMatched == false {
            if let matchedIndex = self.indexOfOnlySelectedCard, index != matchedIndex {
                if cards[matchedIndex].identifier == cards[index].identifier {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                self.indexOfOnlySelectedCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = cards[flipDownIndex].isMatched
                }
                cards[index].isFaceUp = true
                self.indexOfOnlySelectedCard = index
            }
        }
    }
}

struct Card {
    
    var identifier: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var cardState: CardState {
        if isMatched {
            return .matched
        } else if isFaceUp {
            return .front
        } else {
            return .back
        }
    }
    
    init(identifier: Int) {
        self.identifier = identifier
    }
    
}

enum CardState {
    case back, front, matched
}
