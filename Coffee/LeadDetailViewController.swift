//
//  LeadDetailViewController.swift
//  Coffee
//
//  Created by Brian J Glowe on 11/7/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import UIKit
import Parse

class LeadDetailViewController: UIViewController {

    @IBOutlet weak var leadNameLabel: UILabel!
    @IBOutlet weak var leadContactEmailLabel: UILabel!
    @IBOutlet weak var leadCompanyLabel: UILabel!
    @IBOutlet weak var leadPhoneLabel: UILabel!
    @IBOutlet weak var leadRatingLabel: UILabel!
    @IBOutlet weak var leadCommentsLabel: UILabel!
    
    var detailedLead = PFObject?() // lead coming from ViewLeadsTB
    
    var leadToRefresh = PFObject?()
    
    override func viewDidLoad() {
       super.viewDidLoad()

        loadLead()
    print("this is the detailed lead: \(detailedLead)")
    }
    
    override func viewWillAppear(animated: Bool) {
        loadLead()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
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
                    self.leadRatingLabel.text = object.objectForKey("leadRating") as? String
                    self.leadCommentsLabel.text = object.objectForKey("leadComments") as? String
    print("the object from query: \(object)")
    print("number of items in lead array: \(lead?.count)")
                }
            } else {
                print(error)
            }
    }}
    
    
    
    
    
    
    
    
    
    
    
    
 ///////^^^
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditLeadSegue" {
            if let leadToEdit = self.detailedLead {
                let EditLeadController: EditLeadViewController = segue.destinationViewController as! EditLeadViewController
                EditLeadController.leadToEdit = leadToEdit
                print("the lead coming from LeadDetailVC: \(leadToEdit)")
            }
    }}
    
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

    
    
    
    
}
















