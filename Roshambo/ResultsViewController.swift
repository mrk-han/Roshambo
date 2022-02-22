//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Mark Han on 2/20/22.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: Properties
    
    var userChoice: String?
    var result: String?
    
    // MARK: Outlets
    
    @IBOutlet var resultsImage: UIButton!
    @IBOutlet var resultsLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    
    // MARK: Lifecycle + Overrides
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let result = self.result {
            
            print(result)
            self.resultsLabel.text = "You win!!!!!!"
        }
        
//        if let result = self.result {
//            self.resultsImage.setBackgroundImage(UIImage(named: "\(result)"), for: .normal)
//        }
        
        self.resultsImage.alpha = 0
        self.resultsLabel.alpha = 0
        self.playAgainButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.resultsImage.alpha = 1
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
