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
        if winningMove == move {
            return .scissors
        } else if losingMove == move {
            return .paper
        } else {
            return .rock
        }
    }
    
    func evaluatePaper(against move: Move) -> Paper {
        if winningMove == move {
            return .rock
        } else if losingMove == move {
            return .scissors
        } else {
            return .paper
        }
    }
    
    func evaluateScissors(against move: Move) -> Scissors {
        if winningMove == move {
            return .paper
        } else if losingMove == move {
            return .rock
        } else {
            return .scissors
        }
    }
    
    var winningMove: Move {
        switch self {
        case .rock:
            return .scissors
        case .paper:
            return .rock
        case .scissors:
            return .paper
        }
    }
    
    var losingMove: Move {
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
