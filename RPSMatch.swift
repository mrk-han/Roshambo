//
//  RPSMatch.swift
//  Roshambo
//
//  Created by Mark Han on 3/21/22.
//

import Foundation

struct RPSMatch {
    
    let p1: Move
    let p2: Move
    let date: Date
    
    init(p1: Move, p2: Move) {
        self.p1 = p1
        self.p2 = p2
        self.date = Date()
    }
    
}
