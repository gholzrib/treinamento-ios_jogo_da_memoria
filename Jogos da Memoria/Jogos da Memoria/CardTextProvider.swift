//
//  CardTextProvider.swift
//  Jogos da Memoria
//
//  Created by Gunther Ribak on 29/05/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

//protocol CardTextProvider: class {
protocol CardTextProvider: AnyObject {
    
    var emojisOptions: Array<String> { get set }
    var emojis: Dictionary<Int, String> { get set }
    func text(for identifier: Int) -> String
    
}

extension CardTextProvider {
    
    func text(for identifier: Int) -> String {
        if let emoji = emojis[identifier] {
            return emoji
        }
        let emoji = emojisOptions.removeRandom()
        emojis[identifier] = emoji
        return emoji
    }
}

class CuteAnimalsEmojiProvider: CardTextProvider {
    
    var emojisOptions: Array<String> = ["🐶","🐱","🐸","🐭","🦁","🦊"]
    var emojis: Dictionary<Int, String> = [ : ]
    
}

class VehiclesEmojiProvider: CardTextProvider {
    
    var emojisOptions: Array<String> = ["🚗","🚐","🛴","🚞","🚚","🚔"]
    var emojis: Dictionary<Int, String> = [ : ]
    
}

class NumbersProvider: CardTextProvider {
    
    var emojisOptions: Array<String> = ["1","2","3","4","5","6"]
    var emojis: Dictionary<Int, String> = [ : ]
    
}
