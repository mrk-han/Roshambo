//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Mark Han on 3/21/22.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var history: [RPSMatch]!
    var result: String?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "HistoryCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        let match = self.history[(indexPath as NSIndexPath).row]
        
        cell.textLabel!.text = match.result
        cell.detailTextLabel!.text = "\(match.p1) vs. \(match.p2)"
        
        return cell
    }
}
