//
//  Extensions.swift
//  Jogos da Memoria
//
//  Created by Gunther Ribak on 25/05/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

extension Bool {
    
    mutating func toogle() {
        self = !self
    }
    
}

extension Array {
    
    mutating func removeRandom() -> Element {
        let index = Int.random(in: self.indices)
        let unique = self.remove(at: index)
        return unique
    }
    
}
