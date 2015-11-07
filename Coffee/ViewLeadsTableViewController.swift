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

class ViewLeadsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var leadRecordsTable: UITableView!
    
    var leadRecordsFromQuery = [PFObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadData()
//
//        leadRecordsTable.reloadData()

        print("opened")
    }
    
    override func viewWillAppear(animated: Bool) {
        loadData()
        leadRecordsTable.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leadRecordsFromQuery.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("ViewLeadCell", forIndexPath: indexPath)
        
        let record:PFObject = self.leadRecordsFromQuery.reverse()[indexPath.row] as PFObject
        
        cell.detailTextLabel?.text = record.objectForKey("leadContactEmail") as? String
        cell.textLabel?.text = record.objectForKey("leadName") as? String
        
        return cell
    }
    
    func loadData() {
        //****Removes all of the PFObjects from the array so when the table is reloaded that it doesn't add onto the existing objects and the same score won't be listed again.
        leadRecordsFromQuery.removeAll()
        
        let query = PFQuery(className: "LeadRecord")
        query.whereKey("createdBy", equalTo: PFUser.currentUser()!)
        query.orderByAscending("createdAt")
        query.findObjectsInBackgroundWithBlock { (leads: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                
                for object:PFObject in leads! {
                    self.leadRecordsFromQuery.append(object)
                    print(self.leadRecordsFromQuery.count)
                }
                
                //                dispatch_async(dispatch_get_main_queue()) {
                
                self.leadRecordsTable.reloadData()
                
                //                }
                
            } else {
                print(error)
            }
        }
        
    }
    
}























