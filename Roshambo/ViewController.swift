//
//  ViewController.swift
//  Roshambo
//
//  Created by Mark Han on 2/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    @IBOutlet var letsPlayLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pickRock() {
        var rockController: ResultsViewController
        rockController = storyboard?.instantiateViewController(withIdentifier: "ResultsController") as! ResultsViewController
        rockController.resultsImage = nil
        rockController.resultsLabel = nil
        rockController.playAgainButton = nil
        
        present(rockController, animated: true, completion: nil)
        
    }
    


}

