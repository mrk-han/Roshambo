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
            
            let selectedMove = Move.scissors
            controller.userChoice = selectedMove
            
            let generatedMove = Move.random
            controller.generatedAIChoice = generatedMove
            
            controller.resultsViewControllerText = selectedMove.gameResult(against: generatedMove).text
            controller.resultsViewControllerImage = selectedMove.gameResult(against: generatedMove).image
            
            

            
            
        } else if segue.identifier == "paperSegue" { // code + storyboard
            let controller = segue.destination as! ResultsViewController
            
            let selectedMove = Move.paper
            controller.userChoice = selectedMove
            
            let generatedMove = Move.random
            controller.generatedAIChoice = generatedMove
            
            controller.resultsViewControllerText = selectedMove.gameResult(against: generatedMove).text
            controller.resultsViewControllerImage = selectedMove.gameResult(against: generatedMove).image
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
        
        let selectedMove = Move.rock
        controller.userChoice = selectedMove
        
        let generatedMove = Move.random
        controller.generatedAIChoice = generatedMove
        
        controller.resultsViewControllerText = selectedMove.gameResult(against: generatedMove).text
        controller.resultsViewControllerImage = selectedMove.gameResult(against: generatedMove).image
        
        present(controller, animated: true, completion: nil)
    }
}

