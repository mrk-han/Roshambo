//
//  Rock.swift
//  Roshambo
//
//  Created by Mark Han on 2/25/22.
//

import Foundation
import UIKit

enum Scissors {
    
    case rock
    case paper
    case scissors
    
    var text: String {
        switch self {
            
        case .rock:
            return "Scissors gets crushed by Rock, you lose!"
            
        case .paper:
            return "Scissors cuts Paper, you win!"
            
        case .scissors:
            return "Scissors cannot cut scissors, you tie!"
        }
    }
    
    var image: UIImage! {
        switch self {
        
        case .rock:
            return #imageLiteral(resourceName: "RockCrushesScissors")
            
        case .paper:
            return #imageLiteral(resourceName: "ScissorsCutPaper")
            
        case .scissors:
            return #imageLiteral(resourceName: "itsATie")
        }
    }
}
