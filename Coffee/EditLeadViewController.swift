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
    @IBOutlet weak var leadStatusLabel: UILabel!
    
    var leadToEdit = PFObject?() // comes from LeadDetailVC
    
   var updatedLead = PFObject?()
    
//    var updatedLead: PFObject? {
//        didSet {
//            updatedLead = leadToUpdate
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLeadDetails()
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
        leadStatusLabel.text = leadToEdit?.objectForKey("status") as? String
    }
    
    func updateLeadDetails() {
        
        leadToEdit?.setObject(leadPhoneField.text!, forKey: "leadPhone")
        leadToEdit?.setObject(leadEmailField.text!, forKey: "leadContactEmail")
        leadToEdit?.setObject(leadRatingField.text!, forKey: "leadRating")
        print("Updating the lead details \n lead object before save in backgroung: \(leadToEdit)")
        
        leadToEdit!.saveInBackgroundWithBlock{ succeeded, error in
            if succeeded {
                print("this will print from saveinBackground closure")
            } else {
                if let errorMessage = error?.userInfo["error"] as? String {
                    self.showErrorView(error!)
                }
            }}
    }
    
    @IBAction func submitEditButton(sender: AnyObject) {
        updateLeadDetails()
        print("this is the button method")
        print("\(leadToEdit)")
    }
    
    
    // i believe, i need a prepare for segue going back to the LeadDetailVC to be sure the 
    // leadToEdit object is ready to go.
    // the prepare for segue needs to identify the VC going back to
    // and pass the information wished to be sent
    // while along the unwind segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "UpdatedLeadRecord" { // this should be unwind segue identifier
            print("this is the prepare for segue method")
            print("the lead which was updated: \(leadToEdit)")
            
            // need to now assign the updated lead to the variable the unwind segue can receive
            
            updatedLead = leadToEdit
            
            print("print leadToEdit after assignment: \(leadToEdit) \n print updatedLead: \(updatedLead) ")
            
        }
    }
    
    
    
}
















