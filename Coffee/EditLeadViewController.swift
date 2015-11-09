//
//  EditLeadViewController.swift
//  Coffee
//
//  Created by Brian J Glowe on 11/9/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import UIKit
import Parse

class EditLeadViewController: UIViewController {

    @IBOutlet weak var leadNameLabel: UILabel!
    @IBOutlet weak var leadCompanyLabel: UILabel!
    @IBOutlet weak var leadPhoneField: UITextField!
    @IBOutlet weak var leadEmailField: UITextField!
    @IBOutlet weak var leadRatingField: UITextField!
    
    var leadToEdit = PFObject?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLeadDetails()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showLeadDetails() {
        leadNameLabel.text = leadToEdit?.objectForKey("leadName") as? String
        leadCompanyLabel.text = leadToEdit?.objectForKey("leadCompany") as? String
        leadPhoneField.text = leadToEdit?.objectForKey("leadPhone") as? String
        leadEmailField.text = leadToEdit?.objectForKey("leadContactEmail") as? String
        leadRatingField.text = leadToEdit?.objectForKey("leadRating") as? String
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func submitEditButton(sender: AnyObject) {
        
    }

}
