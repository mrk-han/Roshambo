//
//  Move.swift
//  Roshambo
//
//  Created by Mark Han on 2/23/22.
//

import Foundation

enum Move: CaseIterable {
    case rock
    case paper
    case scissors
    
    func gameResult(against move: Move) -> GameResult {
        if beats == move {
            return .win
        } else if losesTo == move {
            return .lose
        } else {
            return .tie
        }
    }
    
    var beats: Move {
        switch self {
        case .rock:
            return .scissors
        case .paper:
            return .rock
        case .scissors:
            return .paper
        }
    }
    var losesTo: Move {
        switch self {
        case .rock:
            return .paper
        case .paper:
            return .scissors
        case .scissors:
            return .rock
        }
    }
    
    static var random: Move {
        Move.allCases.randomElement() ?? .paper
    }
    
    
}
