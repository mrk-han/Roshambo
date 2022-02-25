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
    
    func evaluateRock(against move: Move) -> Rock {
        if beats == move {
            return .scissors
        } else if losesTo == move {
            return .paper
        } else {
            return .rock
        }
    }
    
    func evaluatePaper(against move: Move) -> Paper {
        if beats == move {
            return .rock
        } else if losesTo == move {
            return .scissors
        } else {
            return .paper
        }
    }
    
    func evaluateScissors(against move: Move) -> Scissors {
        if beats == move {
            return .paper
        } else if losesTo == move {
            return .rock
        } else {
            return .scissors
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
  
    // Kauper Suggestion
//    func beats(other: Move) -> Bool {
//
//    }
    
    
}
