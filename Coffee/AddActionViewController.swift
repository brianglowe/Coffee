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

    
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var voicemailButton: UIButton!
    @IBOutlet weak var notesButton: UIButton!
    @IBOutlet weak var apptButton: UIButton!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var saveAndCloseButton: UIButton!
    
    
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var addtCommentsLabel: UILabel!
    

    
    var leadForAction = PFObject?()
    
    var actionType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("leadForAction object at ViewDidLoad: \(leadForAction)")
        
        
        
        
        commentField.hidden = true
        addtCommentsLabel.hidden = true
        submitButton.hidden = true
        saveAndCloseButton.hidden = true
        
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
    
    func createActivity(action: String) {
        let activity = PFObject(className: "Activity")
        activity.setObject(commentField.text!, forKey: "comments")
        activity.setObject(action, forKey: "type")
        activity.setObject((leadForAction?.objectId)!, forKey: "assignedLead")
        
  //      self.typeImage.image = self.imageForType((activity?.objectForKey("type") as? String)!)
        
        activity.saveEventually {(success, error) -> Void in
            if (error == nil) {
                self.submitButton.hidden = true
            } else {
                print(error?.userInfo)
            }
        }
        
        saveAndCloseButton.hidden = false
        
     //   self.navigationController?.popToRootViewControllerAnimated(true) 
    //** works, but testing save and close
    }
    
    
    @IBAction func emailButton(sender: AnyObject) {
        actionType = "email"
        commentField.hidden = false
        addtCommentsLabel.hidden = false
        submitButton.hidden = false
        
        voicemailButton.hidden = true
        notesButton.hidden = true
        apptButton.hidden = true
    }
    
    
    @IBAction func voicemailButton(sender: AnyObject) {
       actionType = "call"
        commentField.hidden = false
        addtCommentsLabel.hidden = false
        submitButton.hidden = false
        
        emailButton.hidden = true
        notesButton.hidden = true
        apptButton.hidden = true
    }
    
    
    @IBAction func notesButton(sender: AnyObject) {
        actionType = "note"
        commentField.hidden = false
        addtCommentsLabel.hidden = false
        submitButton.hidden = false
        
        emailButton.hidden = true
        voicemailButton.hidden = true
        apptButton.hidden = true
    }

    @IBAction func pushApptButton(sender: UIButton) {
        actionType = "appt"
        commentField.hidden = false
        addtCommentsLabel.hidden = false
        submitButton.hidden = false
        
        emailButton.hidden = true
        voicemailButton.hidden = true
        notesButton.hidden = true
    }
    
    @IBAction func submitButton(sender: UIButton) {
        createActivity(self.actionType!)
    }
    
    // MARK: assign the activity to specific image ** bad location
    func imageForActivity(action:String) -> UIImage? {
        let imageName = "\(action)1"
        return UIImage(named: imageName)
    }
    
    
    
}












