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

class ViewLeadsTableViewController: UITableViewController {

    @IBOutlet var leadRecordsTable: UITableView!
    
    var leadRecordsFromQuery = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("opened")
    }
    
    override func viewWillAppear(animated: Bool) {
        loadData()
     //   leadRecordsTable.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowLeadDetailSegue" {
            if let indexPath = self.leadRecordsTable.indexPathForSelectedRow {
                let lead = leadRecordsFromQuery[indexPath.row]
                let destinationController: LeadDetailViewController = segue.destinationViewController as! LeadDetailViewController
                destinationController.detailedLead = lead
         print("the lead coming from the ViewLeadTBVC: \(lead)")
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leadRecordsFromQuery.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ViewLeadCell", forIndexPath: indexPath)
        let record:PFObject = self.leadRecordsFromQuery[indexPath.row] as PFObject
        
        if let nameLabel = cell.viewWithTag(100) as? UILabel {
            nameLabel.text = record.objectForKey("leadName") as? String
        }
        if let companyLabel = cell.viewWithTag(101) as? UILabel {
            companyLabel.text = record.objectForKey("leadCompany") as? String
        }
        if let ratingImageView = cell.viewWithTag(102) as? UIImageView {
            ratingImageView.image = self.imageForRating((record.objectForKey("leadRating") as? String)!)
        }
        
        return cell
    }
    
    func loadData() {
        leadRecordsFromQuery.removeAll()
        
        let query = PFQuery(className: "LeadRecord")
        query.whereKey("createdBy", equalTo: PFUser.currentUser()!)
        query.whereKey("status", equalTo: "pending")
        query.orderByAscending("createdAt")
        query.findObjectsInBackgroundWithBlock { (leads: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                for object:PFObject in leads! {
                    self.leadRecordsFromQuery.append(object)
                    print(self.leadRecordsFromQuery.count)
                }
                self.leadRecordsTable.reloadData()
            } else {
                print(error)
            }
    }}
    
    // assign the rating to specific image
    func imageForRating(rating:String) -> UIImage? {
        let imageName = "\(rating)coffee"
        return UIImage(named: imageName)
    }


    
}























