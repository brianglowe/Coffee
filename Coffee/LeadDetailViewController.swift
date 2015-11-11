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
    
    func showLeadDetails() {
        leadNameLabel.text = detailedLead?.objectForKey("leadName") as? String
        leadContactEmailLabel.text = detailedLead?.objectForKey("leadContactEmail") as? String
        leadCompanyLabel.text = detailedLead?.objectForKey("leadCompany") as? String
        leadPhoneLabel.text = detailedLead?.objectForKey("leadPhone") as? String
        leadRatingLabel.text = detailedLead?.objectForKey("leadRating") as? String
        leadCommentsLabel.text = detailedLead?.objectForKey("leadComments") as? String
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()

        print("this is the detailed lead: \(detailedLead)")
        
        showLeadDetails()
//        self.showLeadDetails()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
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
















