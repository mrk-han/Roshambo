//
//  RockPaperScissorsViewController.swift
//  Roshambo
//
//  Created by Mark Han on 2/20/22.
//

import UIKit

class RockPaperScissorsViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    @IBOutlet var letsPlayLabel: UILabel!
    
    // MARK: Lifecycle + Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Storyboard only, no code demo (User selects Scissors)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "scissorsSegue" { // only storyboard
            
            let controller = segue.destination as! ResultsViewController
            
            // Move is scissors because user clicked scissors
            let usersMove = Move.scissors
            
            let computersMove = Move.random
            
            controller.resultsViewControllerText = usersMove.evaluateScissors(against: computersMove).text
            
            controller.resultsViewControllerImage = usersMove.evaluateScissors(against: computersMove).image
            
        } else if segue.identifier == "paperSegue" { // code + storyboard
            
            let controller = segue.destination as! ResultsViewController
            
            let usersMove = Move.paper
            
            let computersMove = Move.random
            
            controller.resultsViewControllerText = usersMove.evaluatePaper(against: computersMove).text
            
            controller.resultsViewControllerImage = usersMove.evaluatePaper(against: computersMove).image
        }
    }
    // MARK: Actions
    
    // Storyboard AND Code Demo (User selects Paper)
    @IBAction func letsPlayPaper() {
        self.performSegue(withIdentifier: "paperSegue", sender: self)
    }
    
    // Code only, NO STORYBOARD demo (User selects Rock)
    @IBAction func letsPlayRock() {
        
        let  controller = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        let usersMove = Move.rock
        
        let computersMove = Move.random
        
        controller.resultsViewControllerText = usersMove.evaluateRock(against: computersMove).text
        
        controller.resultsViewControllerImage = usersMove.evaluateRock(against: computersMove).image
        
        present(controller, animated: true, completion: nil)
    }
}

