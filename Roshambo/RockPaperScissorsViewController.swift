//
//  RockPaperScissorsViewController.swift
//  Roshambo
//
//  Created by Mark Han on 2/20/22.
//

import UIKit

class RockPaperScissorsViewController: UIViewController {
    
    
    var history = [RPSMatch]()
    
    var result: String?
    
    
    // MARK: Outlets
    
    
    @IBOutlet var historyButton: UIButton!
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
            
            // important to note when this variable is set, lifespan is 1 match
            let computersMove = Move.random
            
            // evaluating game result and saving to result string to be put into the RPSMatch
            result = usersMove.evaluateScissors(against: computersMove).text
            
            // passing result to ResultsViewControler
            controller.resultsViewControllerText = result
            
            // evaluating game result again to get image
            controller.resultsViewControllerImage = usersMove.evaluateScissors(against: computersMove).image
            
            // create record of match here
            let match = RPSMatch(p1: usersMove, p2: computersMove, result: result)
            history.append(match)
            
        } else if segue.identifier == "paperSegue" { // code + storyboard
            
            let controller = segue.destination as! ResultsViewController
            
            let usersMove = Move.paper
            
            let computersMove = Move.random
            
            result = usersMove.evaluatePaper(against: computersMove).text
            
            controller.resultsViewControllerText = result
            
            controller.resultsViewControllerImage = usersMove.evaluatePaper(against: computersMove).image
            
            // create record of match here
            let match = RPSMatch(p1: usersMove, p2: computersMove, result: result)
            history.append(match)
            
        }
    }
    // MARK: Actions
    
    // Storyboard AND Code Demo (User selects Paper)
    @IBAction func letsPlayPaper() {
        self.performSegue(withIdentifier: "paperSegue", sender: self)
    }
    
    // Code only, NO STORYBOARD demo (User selects Rock)
    @IBAction func letsPlayRock() {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        let usersMove = Move.rock
        
        let computersMove = Move.random
        
        result = usersMove.evaluateRock(against: computersMove).text
        
        controller.resultsViewControllerText = result
        
        controller.resultsViewControllerImage = usersMove.evaluateRock(against: computersMove).image
        
        // create record of match here
        let match = RPSMatch(p1: usersMove, p2: computersMove, result: result)
        history.append(match)
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func presentHistoryPage(_ seneder: AnyObject) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        
        controller.history = self.history
        controller.result = self.result
        
        present(controller, animated: true, completion: nil)
    }
}

