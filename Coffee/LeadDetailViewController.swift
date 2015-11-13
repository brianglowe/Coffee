//
//  LeadDetailViewController.swift
//  Coffee
//
//  Created by Brian J Glowe on 11/7/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class LeadDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var activityTable: UITableView!
    
    @IBOutlet weak var leadNameLabel: UILabel!
    @IBOutlet weak var leadContactEmailLabel: UILabel!
    @IBOutlet weak var leadCompanyLabel: UILabel!
    @IBOutlet weak var leadPhoneLabel: UILabel!
    @IBOutlet weak var leadRatingLabel: UILabel!
    @IBOutlet weak var leadStatusLabel: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    
    var detailedLead = PFObject?() // lead coming from ViewLeadsTB
    
    var activitiesFromQuery = [PFObject]()
    var detailActivity = PFObject?()
    
    var leadToRefresh = PFObject?()
    
    override func viewDidLoad() {
       super.viewDidLoad()

        loadLead()
        loadActivities()
        
    print("this is the detailed lead: \(detailedLead)")
    }
    
    override func viewWillAppear(animated: Bool) {
        loadLead()
        loadActivities()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Mark: Activity table view methods
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activitiesFromQuery.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("ActivityCell", forIndexPath: indexPath)
        let action:PFObject = self.activitiesFromQuery[indexPath.row] as PFObject
        
        cell.detailTextLabel?.text = action.objectForKey("updatedAt") as? String
        cell.textLabel?.text = action.objectForKey("type") as? String
        
        return cell
    }
    
    // Mark: load lead record's activities
    func loadActivities() {
        activitiesFromQuery.removeAll()
        
        let query = PFQuery(className: "Activity")
        query.whereKey("assignedLead", equalTo: (detailedLead?.objectId)!)

        query.orderByDescending("createdAt")
        query.findObjectsInBackgroundWithBlock { (action: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                for object: PFObject in action! {
                    self.activitiesFromQuery.append(object)
                    print(self.activitiesFromQuery.capacity)
                }
                self.activityTable.reloadData()
            }   else {
                print(error)
            }
        }
    }
    
    // Mark: - load lead records based on users
    func loadLead() {
        let query = PFQuery(className: "LeadRecord")
        query.whereKey("objectId", equalTo: (detailedLead?.objectId)!)
        query.findObjectsInBackgroundWithBlock { (lead: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                for object:PFObject in lead! {
                    self.leadNameLabel.text = object.objectForKey("leadName") as? String
                    self.leadContactEmailLabel.text = object.objectForKey("leadContactEmail") as? String
                    self.leadCompanyLabel.text = object.objectForKey("leadCompany") as? String
                    self.leadPhoneLabel.text = object.objectForKey("leadPhone") as? String
                    self.leadRatingLabel.text = "This lead is \((object.objectForKey("leadRating") as? String)!)"
  //                  self.leadCommentsLabel.text = object.objectForKey("leadComments") as? String
                    self.leadStatusLabel.text = object.objectForKey("status") as? String
                    self.ratingImage.image = self.imageForRating((object.objectForKey("leadRating") as? String)!)
                }
            } else {
                print(error)
            }
    }}
    
    // Mark: Seque methods
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditLeadSegue" {
            if let leadToEdit = self.detailedLead {
                let EditLeadController: EditLeadViewController = segue.destinationViewController as! EditLeadViewController
                EditLeadController.leadToEdit = leadToEdit
                print("the lead coming from LeadDetailVC: \(leadToEdit)")
            }
        } else if segue.identifier == "AddActionSegue" {
            if let lead = self.detailedLead {
                let AddActionVC: AddActionViewController = segue.destinationViewController as! AddActionViewController
                AddActionVC.leadForAction = lead
                print("lead going to AddActionVC: \(lead)")
            }
        } else if segue.identifier == "ActivityDetailSegue" {
            if let indexPath = self.activityTable.indexPathForSelectedRow {
                let activity = activitiesFromQuery[indexPath.row]
                let detailActivityVC: ActivityDetailViewController = segue.destinationViewController as! ActivityDetailViewController
                detailActivityVC.activity = activity
                detailActivityVC.lead = self.detailedLead
                print("the activity coming from the LeadDetailVC: \(activity)")
            }
        } else {
            if let update = self.detailedLead {
                let UpdateStatusVC: UpdateStatusViewController = segue.destinationViewController as! UpdateStatusViewController
                UpdateStatusVC.leadToUpdate = update
                print("lead going to UpdateStatusVC: \(update)")
            }
        }
    }
    
    @IBAction func editLeadButton(sender: AnyObject) {
    }
    
// this unwind segue needs to set up this controller to receive the updated lead from
// the EditLeadVC
    @IBAction func unwindWithUpdatedLead(segue:UIStoryboardSegue) {
        if let editLeadVC = segue.sourceViewController as? EditLeadViewController {
            if let lead = editLeadVC.updatedLead {
                detailedLead = lead
            }
        }
        print(" printed from unwind: \(detailedLead)")
        print("this is the unwind segue print statement")
    }

    // assign the rating to specific image ** SHould be in model class
    func imageForRating(rating:String) -> UIImage? {
        let imageName = "\(rating)coffee"
        return UIImage(named: imageName)
    }
    
    
}
















