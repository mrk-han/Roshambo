//
//  Paper.swift
//  Roshambo
//
//  Created by Mark Han on 2/25/22.
//

import Foundation
import UIKit

enum Paper {
    
    case rock
    case paper
    case scissors
    
    var text: String {
        switch self {
            
        case .rock:
            return "Paper coves Rock, you win!"
            
        case .paper:
            return "Paper + Paper, you tie!"
            
        case .scissors:
            return "Paper gets cut by scissors, you lose!"
        }
    }
    
    var image: UIImage! {
        switch self {
        
        case .rock:
            return UIImage(named: "PaperCoversRock")
            
        case .paper:
            return UIImage(named: "itsATie")
            
        case .scissors:
            return UIImage(named: "ScissorsCutPaper")
        }
    }
}
