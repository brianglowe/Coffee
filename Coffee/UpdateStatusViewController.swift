//
//  UpdateStatusViewController.swift
//  Coffee
//
//  Created by Brian J Glowe on 11/11/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import UIKit

class UpdateStatusViewController: UIViewController {

    @IBOutlet weak var pendingButton: UIButton!
    @IBOutlet weak var winButton: UIButton!
    @IBOutlet weak var lostButton: UIButton!
    
    @IBOutlet weak var leadNameLabel: UILabel!
    @IBOutlet weak var addtCommentsLabel: UILabel!
    @IBOutlet weak var commentField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func pushPendingButton(sender: AnyObject) {
    }
    
    @IBAction func pushWinButton(sender: AnyObject) {
    }
    
    @IBAction func pushLostButton(sender: AnyObject) {
    }
    
    @IBAction func pushUpdateButton(sender: AnyObject) {
    }
    
}
