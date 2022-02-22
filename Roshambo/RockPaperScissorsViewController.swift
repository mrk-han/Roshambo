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
            
            controller.result = decideGameResult(between: generateAIRoshambo(from: generateRandomNumber()), and: segue.identifier)
            
        } else if segue.identifier == "paperSegue" { // code + storyboard
            let controller = segue.destination as! ResultsViewController
            
            controller.result = decideGameResult(between: generateAIRoshambo(from: generateRandomNumber()), and: segue.identifier)
            
        }
    }
    
    // MARK: Simulate computer AI
    
    func generateRandomNumber() -> Int {
        
        // generate random Int32 using arc4random -- generates 1 2 or 3
        let randomValue = 1 + arc4random() % 3
        
        return Int(randomValue)
    }
    
    func generateAIRoshambo(from number: Int) -> String {
        switch Int(number) {
        case 1:
            return "Rock"
        case 2:
            return "Paper"
        case 3:
            return "Scissors"
        default:
            return "This should never happen, number generated: \(number)"
        }
    }
    
    // playerRoshambo is decided by the segue.identifier because what the user clicks triggers a named segue which shows their intent
    func decideGameResult(between aiRoshambo: String, and playerRoshambo: String?) -> String {
        
        if (aiRoshambo == "Rock") && (playerRoshambo == "paperSegue") {
            return "Lose1"
        } else if (aiRoshambo == "Rock") && (playerRoshambo == "scissorsSegue") {
            return "Win1"
        } else if (aiRoshambo == "Rock") && playerRoshambo == nil {
            return "Tie1" // segue is nil if using Code method for Rock because VC is presented without storyboard
        }
        
        return aiRoshambo
        
    }
    
    // MARK: Actions
    
    // Storyboard AND Code Demo (User selects Paper)
    @IBAction func letsPlayPaper() {
        self.performSegue(withIdentifier: "paperSegue", sender: self)
    }
    
    // Code only, NO STORYBOARD demo (User selects Rock)
    @IBAction func letsPlayRock() {
        
        // create and cast view controller
        let controller: ResultsViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        // prep next view
        
        controller.result = decideGameResult(between: generateAIRoshambo(from: generateRandomNumber()), and: nil)
        
        // present next screen without segue
        present(controller, animated: true, completion: nil)
    }
}

