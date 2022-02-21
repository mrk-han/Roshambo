//
//  ViewController.swift
//  Roshambo
//
//  Created by Mark Han on 2/20/22.
//

import UIKit

class RockPaperScissorsViewController: UIViewController {
    
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    @IBOutlet var letsPlayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Storyboard only, no code demo (User selects Scissors)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "scissorsSegue" { // only storyboard
            print("user tapped scissors - in prepare function")
            
            let controller = segue.destination as! ResultsViewController
            controller.resultsImage = nil
            controller.resultsLabel = nil
            
        } else if segue.identifier == "paperSegue" { // code + storyboard
            print("user tapped paper - in prepare func")

            let controller = segue.destination as! ResultsViewController
            controller.resultsImage = nil
            controller.resultsLabel = nil
            
        }
    }
    
    // Storyboard AND Code Demo (User selects Paper)
    @IBAction func letsPlayPaper() {
        print("letsPlayPaper method call")
        
        // perform paper segue
        self.performSegue(withIdentifier: "paperSegue", sender: self)
    }
    
    // Code only, NO STORYBOARD demo (User selects Rock)
    @IBAction func letsPlayRock() {
        print("letsPlayRock method call")
        
        // create and cast view controller
        let controller: ResultsViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        // prep next view
        controller.resultsImage = nil
        controller.resultsLabel = nil
        
        // present next screen without segue
        present(controller, animated: true, completion: nil)
    }
}

