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
    
    var detailedLead: PFObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    var leadName: String?
    var leadContactEmail: String?
    
    func configureView() {
        if let lead = self.detailedLead {
            if let label = self.leadNameLabel {
                label.text = lead.objectForKey("leadName") as? String
            }
        }
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
       
//        if detailedLead == nil {
//            print("nothing there")
//        } else {
//            print("the detailedLead has something there")
//        }
        
        
        self.configureView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // 1- Add ability to edit the current lead record
    // add button to add action / activity to the record.
    
    
}
 