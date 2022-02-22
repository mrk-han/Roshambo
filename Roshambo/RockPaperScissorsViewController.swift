//
//  ViewController.swift
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
            controller.didUserChooseScissors = true
            controller.randomRoshamboValue = generateRandomRoshambo()
            
        } else if segue.identifier == "paperSegue" { // code + storyboard
            
            let controller = segue.destination as! ResultsViewController
            controller.didUserChoosePaper = true
            controller.randomRoshamboValue = generateRandomRoshambo()
            
        }
    }
    
    // MARK: Simulate computer AI
    
    func generateRandomRoshambo() -> String {
        
        // generate random Int32 using arc4random
        let randomValue = 1 + arc4random() % 3
        
        switch Int(randomValue) {
        case 1:
            return "Rock"
        case 2:
            return "Paper"
        case 3:
            return "Scissors"
        default:
            return "This should never happen, number generated: \(randomValue)"
        }
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
        controller.randomRoshamboValue = generateRandomRoshambo()
        controller.didUserChooseRock = true
        
        // present next screen without segue
        present(controller, animated: true, completion: nil)
    }
}

