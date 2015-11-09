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
    
//    var detailedLead: PFObject? {
//        didSet {
//            // Update the view.
//            self.showLeadDetails()
//        }
//    }
    
    func showLeadDetails() {
        leadNameLabel.text = detailedLead?.objectForKey("leadName") as? String
        leadContactEmailLabel.text = detailedLead?.objectForKey("leadEmail") as? String
        leadCompanyLabel.text = detailedLead?.objectForKey("leadCompany") as? String
        leadPhoneLabel.text = detailedLead?.objectForKey("leadPhone") as? String
        leadRatingLabel.text = detailedLead?.objectForKey("leadRating") as? String
        leadCommentsLabel.text = detailedLead?.objectForKey("leadComments") as? String
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        self.showLeadDetails()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // 1- Add ability to edit the current lead record
    // add button to add action / activity to the record.
    
    
}
 