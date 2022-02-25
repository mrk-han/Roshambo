//
//  GameResult.swift
//  Roshambo
//
//  Created by Mark Han on 2/23/22.
//

import Foundation
import UIKit

enum GameResult {
    
    case win
    case lose
    case tie
    
    var text: String {
        switch self {
        case .win:
            return "You Win!"
        case .lose:
            return "You Lose!"
        case .tie:
            return "It's a Tie!"
        }
    }
    
    var image: UIImage! {
        switch self {
            
        case .win:
            return UIImage(named: "RockCrushesScissors")
        case .lose:
            return UIImage(named: "PaperCoversRock")
        case .tie:
            return UIImage(named: "ScissorsCutPaper")
        }
    }
}
