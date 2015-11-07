//
//  NewLeadViewController.swift
//  Coffee
//
//  Created by Brian J Glowe on 11/5/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import UIKit
import Parse

class NewLeadViewController: UIViewController {

    @IBOutlet weak var leadNameField: UITextField!
    @IBOutlet weak var leadEmailField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveLead() {
        let lead = PFObject(className: "LeadRecord")
        lead.setObject(leadNameField.text!, forKey: "leadName")
        lead.setObject(leadEmailField.text!, forKey: "leadContactEmail")
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
    
    @IBAction func submitPressed(sender: AnyObject) {
        
        saveLead()
    }

}










