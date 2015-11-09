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
    
    var detailedLead = PFObject?()
    
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

        showLeadDetails()
//        self.showLeadDetails()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditLeadSegue" {
            if let leadToEdit = self.detailedLead {
                let destinationController: EditLeadViewController = segue.destinationViewController as! EditLeadViewController
                destinationController.leadToEdit = leadToEdit
                print("the lead coming from LeadDetailVC: \(leadToEdit)")
            }
        }
    }
    
    @IBAction func editLeadButton(sender: AnyObject) {
    }
    
    // 1- Add ability to edit the current lead record
    // add button to add action / activity to the record.
    
    
}






















