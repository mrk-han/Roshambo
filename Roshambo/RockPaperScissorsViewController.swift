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
    
    /*
     playerRoshambo is decided by the segue.identifier because what the user clicks triggers a named segue which shows their intent. It will be nil if the user chooses rock, because the rockButton creater the viewcontroller without storyboard and therefore will not use a segue.
     */
    func decideGameResult(between aiRoshambo: String, and playerRoshambo: String?) -> String {
        
        print("Player: \(playerRoshambo ?? "rockSegue")")
        print("AI: \(aiRoshambo)")

        
//        if (aiRoshambo == "Rock") && (playerRoshambo == "paperSegue") {
//            return "Win1"
//        } else if (aiRoshambo == "Rock") && (playerRoshambo == "scissorsSegue") {
//            return "Lose1"
//        } else if (aiRoshambo == "Rock") && playerRoshambo == nil {
//            return "Tie1"
//        } else if (aiRoshambo == "Paper") && (playerRoshambo == "paperSegue") {
//            return "Tie2"
//        } else if (aiRoshambo == "Paper") && (playerRoshambo == "scissorsSegue") {
//            return "Win2"
//        } else if (aiRoshambo == "Paper") && playerRoshambo == nil {
//            return "Lose2"
//        } else if (aiRoshambo == "Scissors") && (playerRoshambo == "paperSegue") {
//            return "Lose3"
//        } else if (aiRoshambo == "Scissors") && (playerRoshambo == "scissorsSegue") {
//            return "Tie3"
//        } else if (aiRoshambo == "Scissors") && playerRoshambo == nil {
//            return "Win3"
//        }
        
        switch playerRoshambo {
        case nil:
            if aiRoshambo == "Rock" {
                return "Tie"
            }
            if aiRoshambo == "Paper" {
                return "Lose"
            }
            if aiRoshambo == "Scissors" {
                return "Win"
            }
        case "paperSegue":
            if aiRoshambo == "Rock" {
                return "Win"
            }
            if aiRoshambo == "Paper" {
                return "Tie"
            }
            if aiRoshambo == "Scissors" {
                return "Lose"
            }
        case "scissorsSegue":
            if aiRoshambo == "Rock" {
                return "Lose"
            }
            if aiRoshambo == "Paper" {
                return "Win"
            }
            if aiRoshambo == "Scissors" {
                return "Tie"
            }
            
        case .some(_):
            return "This should not happen"
        }
        return "This also should not happen"
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

