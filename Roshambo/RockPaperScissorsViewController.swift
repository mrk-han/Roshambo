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
            
            controller.resultsViewControllerText = Move.scissors.gameResult(against: Move.random).text
            controller.resultsViewControllerImage = Move.scissors.gameResult(against: Move.random).image
            
            
        } else if segue.identifier == "paperSegue" { // code + storyboard
            let controller = segue.destination as! ResultsViewController
            
            controller.resultsViewControllerText = Move.paper.gameResult(against: Move.random).text
            controller.resultsViewControllerImage = Move.paper.gameResult(against: Move.random).image
            
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
        
        controller.resultsViewControllerText = Move.rock.gameResult(against: Move.random).text
        controller.resultsViewControllerImage = Move.rock.gameResult(against: Move.random).image
        
        present(controller, animated: true, completion: nil)
    }
}

