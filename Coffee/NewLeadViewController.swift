//
//  NewLeadViewController.swift
//  Coffee
//
//  Created by Brian J Glowe on 11/5/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import UIKit
import Parse

class NewLeadViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var leadNameField: UITextField!
    @IBOutlet weak var leadEmailField: UITextField!
    @IBOutlet weak var leadCompanyField: UITextField!
    @IBOutlet weak var leadNumberField: UITextField!
    @IBOutlet weak var leadRatingField: UITextField!
    @IBOutlet weak var leadCommentsField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    
    //MARK: SwiftCop Fun
    
    @IBOutlet weak var nameVerifyMessage: UILabel!
    @IBOutlet weak var emailVerifyMessage: UILabel!
    
    let swiftCop = SwiftCop()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Text field deleggates
        leadNameField.delegate = self
        leadEmailField.delegate = self
        leadCompanyField.delegate = self
        leadNumberField.delegate = self
        leadRatingField.delegate = self
        leadCommentsField.delegate = self
        
        
        // trying out swiftcop
        swiftCop.addSuspect(Suspect(view: self.leadNameField, sentence: "Full name please"){
            return $0.componentsSeparatedByString(" ").filter{$0 != ""}.count >= 2
            })
        swiftCop.addSuspect(Suspect(view:self.leadEmailField, sentence: "Invalid email", trial: Trial.Email))
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // remove keyboard upon tapping
    func removeTextField(textField: UITextField) -> Bool {
        leadNameField.resignFirstResponder()
        leadEmailField.resignFirstResponder()
        leadCompanyField.resignFirstResponder()
        leadNumberField.resignFirstResponder()
        leadRatingField.resignFirstResponder()
        leadCommentsField.resignFirstResponder()
        return true;
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        leadNameField.resignFirstResponder()
        leadEmailField.resignFirstResponder()
        leadCompanyField.resignFirstResponder()
        leadNumberField.resignFirstResponder()
        leadRatingField.resignFirstResponder()
        leadCommentsField.resignFirstResponder()
        self.view.endEditing(true)
    }
    

// I think I will want to move this fucntion to LeadRecord.swift.  Possible conflicts between the NewLeadVC and the user movingn through Views concern me. Also, this may be a violation of MVC.
    func saveLead() {
        let lead = PFObject(className: "LeadRecord")
        lead.setObject(leadNameField.text!, forKey: "leadName")
        lead.setObject(leadEmailField.text!, forKey: "leadContactEmail")
        lead.setObject(leadCompanyField.text!, forKey: "leadCompany")
        lead.setObject(leadNumberField.text!, forKey: "leadPhone")
        lead.setObject(leadRatingField.text!, forKey: "leadRating")
        lead.setObject(leadCommentsField.text!, forKey: "leadComments")
        lead.setObject("pending", forKey: "status")
        lead.setObject(PFUser.currentUser()!, forKey: "createdBy")
        lead.saveInBackgroundWithBlock{ succeeded, error in
            if succeeded {
                
                self.tabBarController?.popoverPresentationController
            } else {
                if let errorMessage = error?.userInfo["error"] as? String {
                    self.showErrorView(error!)
                }
                
                print("new lead created: \(lead)")
    }}}
    
    func clearFields() {
        leadNameField.text?.removeAll()
        leadEmailField.text?.removeAll()
        leadCompanyField.text?.removeAll()
        leadNumberField.text?.removeAll()
        leadRatingField.text?.removeAll()
        leadCommentsField.text?.removeAll()
    }
    
    
    @IBAction func validateEmail(sender: UITextField) {
        self.emailVerifyMessage.text = swiftCop.isGuilty(sender)?.verdict()
    }
    @IBAction func validateFullName(sender: UITextField) {
        self.nameVerifyMessage.text = swiftCop.isGuilty(sender)?.verdict()
    }
    
    
    
    @IBAction func submitPressed(sender: AnyObject) {
        saveLead()
        clearFields()
    }


    
    
}










