//
//  ViewLeadsTableViewController.swift
//  Coffee
//
//  Created by Brian J Glowe on 11/6/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ViewLeadsTableViewController: PFQueryTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        loadObjects()
    }
    
    override func queryForTable() -> PFQuery {
        let query = LeadRecord.query()
        return query!
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("ViewLeadCell", forIndexPath: indexPath) as! ViewLeadTableViewCell
        let lead = object as! LeadRecord
        
        let creationDate = lead.createdAt
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm dd/mm yyyy"
        let dateString = dateFormatter.stringFromDate(creationDate!)
    
//        cell.textLabel?.text = lead.leadName
//        cell.detailTextLabel?.text = lead.leadContactInfo
        
//        
//        if let username = lead.createdBy.username {
//            cell.createdByLabel.text = "Uploaded by: \(username), \(dateString)"
//        } else {
//            cell.createdByLabel.text = "Uploaded by anonymous: , \(dateString)"
//        }
    
        cell.leadNameLabel.text = lead.leadName
        
        cell.leadContactInfoLabel.text = lead.leadContactInfo
        
        return cell
    }


}

// the method below replaces the UITableView data source method with a more suitable form. you get the returned PFObject as a parameter, without the need to search it in a results array using an index path.
//1- Dequeue a cell from the table view, and cast it to a ViewLeadTableViewCell
//2- cast the given PFObject to a LeadRecord object
//3- Add the creation date, the user's name and the comment to the cell.



