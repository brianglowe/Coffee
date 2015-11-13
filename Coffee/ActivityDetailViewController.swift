//
//  ActivityDetailViewController.swift
//  Coffee
//
//  Created by Brian J Glowe on 11/11/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import UIKit
import Parse

class ActivityDetailViewController: UIViewController {

    @IBOutlet weak var activityTypeLabel: UILabel!
    @IBOutlet weak var leadNameLabel: UILabel!
    @IBOutlet weak var activityCommentLabel: UILabel!
    
    @IBOutlet weak var typeImage: UIImageView!
    
    
    var lead = PFObject?()
    var activity = PFObject?()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        print("printing the activity date created: \(self.activity?.objectForKey("createdAt"))")
        
        showActivityDetails()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Presenting information
    func showActivityDetails() {
        activityTypeLabel.text = self.activity?.objectForKey("type") as? String
        self.typeImage.image = self.imageForType((activity?.objectForKey("type") as? String)!)

        leadNameLabel.text = self.lead?.objectForKey("leadName") as? String
        activityCommentLabel.text = self.activity?.objectForKey("comments") as? String
    }
    
    @IBAction func pushCloseButton(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    // MARK: assign the rating to specific image ** bad location
    func imageForType(type:String) -> UIImage? {
        let imageName = "\(type)2"
        return UIImage(named: imageName)
    }
    
    
}
