//
//  Rock.swift
//  Roshambo
//
//  Created by Mark Han on 2/25/22.
//

import Foundation
import UIKit

enum Rock {
    
    case rock
    case paper
    case scissors
    
    var text: String {
        switch self {
            
        case .rock:
            return "An immovable object meets an unstoppable force, you tie!"
            
        case .paper:
            return "Rock gets covered by paper, you lose!"
            
        case .scissors:
            return "Rock smashes scissors, you win!"
        }
    }
    
    var image: UIImage! {
        switch self {
        
        case .rock:
            return UIImage(named: "itsATie")
            
        case .paper:
            return UIImage(named: "PaperCoversRock")
            
        case .scissors:
            return UIImage(named: "RockCrushesScissors")
        }
    }
}
