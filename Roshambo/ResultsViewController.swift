//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Mark Han on 2/20/22.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {
    
    var resultsViewControllerText: String?
    var resultsViewControllerImage: UIImage?
    var userChoice: Move?
    var generatedAIChoice: Move?
    
    // MARK: Outlets
    
    @IBOutlet var resultsButton: UIButton!
    @IBOutlet var resultsLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    
    // MARK: Lifecycle + Overrides
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        print("debug: \(resultsViewControllerImage)")
        
        self.resultsButton.setBackgroundImage(resultsViewControllerImage, for: UIControl.State.normal)
        self.resultsLabel.text = resultsViewControllerText
        print("User: \(userChoice) vs Computer: \(generatedAIChoice)")
        
        self.resultsButton.alpha = 0
        self.resultsLabel.alpha = 0
        self.playAgainButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        UIView.animate(withDuration: 0.5) {
            self.resultsButton.alpha = 1
            self.resultsLabel.alpha = 1
            self.playAgainButton.alpha = 1
        }
    }
    
    //MARK: Actions
    
    @IBAction func dismiss() {
        // dismiss this view controller
        self.dismiss(animated: true, completion: nil)
    }
}
