//
//  UpdateStatusViewController.swift
//  Coffee
//
//  Created by Brian J Glowe on 11/11/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import UIKit
import Parse

class UpdateStatusViewController: UIViewController {

    @IBOutlet weak var pendingButton: UIButton!
    @IBOutlet weak var winButton: UIButton!
    @IBOutlet weak var lostButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var leadNameLabel: UILabel!
    @IBOutlet weak var addtCommentsLabel: UILabel!
    @IBOutlet weak var commentField: UITextField!
 
    
    
    var leadToUpdate = PFObject?()
    
    var status: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("leadToUpdate at ViewDidLoad: \(leadToUpdate)")
        initiateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: present name of lead record & beginning view
    func presentLeadName() {
        if let name = leadToUpdate {
            leadNameLabel.text = leadToUpdate?.objectForKey("leadName") as? String
        }
    }
    
    func initiateView() {
        presentLeadName()
        pendingButton.hidden = true
        commentField.hidden = true
        addtCommentsLabel.hidden = true
        commentField.hidden = true
        closeButton.hidden = true
    }
    
    // MARK: updating lead status methods
    func showCommentInput() {
        if self.status == "win" {
            addtCommentsLabel.hidden = false
            commentField.hidden = false
            lostButton.hidden = true
        } else {
            addtCommentsLabel.hidden = false
            commentField.hidden = false
            winButton.hidden = true
        }
    }

    // MARK: UPDATE PARSE
    // Update the LeadRecord Object property of "status"
    func updateLeadRecordStatus() {
        leadToUpdate?.setObject(self.status!, forKey: "status")
        leadToUpdate!.saveInBackgroundWithBlock{ succeeded, error in
            if succeeded {
                print("this will print from updateLeadRecordStatus closure")
            } else {
                if let errorMessage = error?.userInfo["error"] as? String {
                    self.showErrorView(error!)
                }
        }}
    }
    
    // Create Activity of type Closed for assigned lead record
    func createCloseActivity() { //Test to see if successfully update without taking a parameter
        let update = PFObject(className: "Activity")
        update.setObject(self.status!, forKey: "type")
        update.setObject(commentField.text!, forKey: "comments")
        update.setObject((leadToUpdate?.objectId)!, forKey: "assignedLead")
        update.saveEventually {(success, error) -> Void in
            if (error == nil) {
                self.closeButton.hidden = false
            } else {
                print(error?.userInfo)
            }
        }
        
        
    }

    // MARK: button methods
    @IBAction func pushPendingButton(sender: AnyObject) {
    }
    
    @IBAction func pushWinButton(sender: AnyObject) {
        self.status = "win"
        showCommentInput()
    }
    
    @IBAction func pushLostButton(sender: AnyObject) {
        self.status = "lost"
        showCommentInput()
    }
    
    @IBAction func pushUpdateButton(sender: AnyObject) {
        updateLeadRecordStatus()
        createCloseActivity()
        print("update Button pressed")
    }
    
    @IBAction func pushCloseButton(sender: UIButton) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
}











