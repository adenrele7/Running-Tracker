//
//  RunDetailsView.swift
//  Running Tracker
//
//  Created by Make School on 8/8/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class RunDetailsView: UITableViewController {
    
    var logs = [Log]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    // 1
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logs.count
    }
    
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 3
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath)
        
        // 4
        cell.textLabel?.text = "Yay - it's working!"
        
        // 5
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //1
//            CoreDataHelper.delete(Log: logs[indexPath.row])
            //2
//            log = CoreDataHelper.retrieveNotes()
        }
    }

    
}
