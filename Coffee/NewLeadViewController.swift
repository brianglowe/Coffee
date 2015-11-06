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
        
        let lead = PFObject(className: "leadRecord")
        lead.setObject(leadNameField.text!, forKey: "leadName")
        lead.setObject(leadEmailField.text!, forKey: "leadContactEmail")
        
//        
//        let lead = LeadRecord(leadName: self.leadNameField.text, contactInfo: self.leadEmailField.text, createdBy: (PFUser.currentUser()!))
        print(lead)
        
        lead.saveInBackgroundWithBlock{ succeeded, error in
            if succeeded {
                self.tabBarController?.popoverPresentationController
            } else {
                if let errorMessage = error?.userInfo["error"] as? String {
                    self.showErrorView(error!)
                }
            }
        }
    }
    
    @IBAction func submitPressed(sender: AnyObject) {
        
        saveLead()
        
    }

}
//
//    let player = PFObject(className: "Player")//1
//    player.setObject("John", forKey: "Name")
//    player.setObject(1230, forKey: "Score")//2
//    player.save()//3
//
//    let player = PFObject(className: "Player")
//    player.setObject("Jack", forKey: "Name")
//    player.setObject(840, forKey: "Score")
//    player.saveInBackgroundWithBlock { (succeeded, error) -> Void in
//      if succeeded {
//        println("Object Uploaded")
//      } else {
//        println("Error: \(error) \(error.userInfo!)")
//      }
//    }
//
//    let query = PFQuery(className: "Player") //1
//    query.whereKey("Name", equalTo: "John") //2
//    query.whereKey("Score", greaterThan: 1000) //3
//    query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in //4
//      if error == nil {
//        println("Successfully retrieved: \(objects)")
//      } else {
//        println("Error: \(error) \(error.userInfo!)")
//      }
//    }










