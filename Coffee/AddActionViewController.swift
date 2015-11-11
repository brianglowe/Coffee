//
//  AddActionViewController.swift
//  Coffee
//
//  Created by Brian J Glowe on 11/11/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import UIKit
import Parse

class AddActionViewController: UIViewController {

    
    @IBOutlet weak var commentField: UITextView!
    
    var leadForAction = PFObject?()
    
    var activityOfLead: PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityOfLead?.objectForKey("activityOfLead") = self.leadForAction?.objectId

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // func to set the activity key to email, lvm, or notes and then hide the other buttons
    
    func setActivityTitleValue() {
        // set the objectKey value to string
        
        // hide other buttons
    }
    
    @IBAction func emailButton(sender: AnyObject) {
    }
    
    
    @IBAction func voicemailButton(sender: AnyObject) {
    }
    
    
    @IBAction func notesButton(sender: AnyObject) {
    }

}
