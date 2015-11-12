//
//  UIViewControllerExtension.swift
//  Coffee
//
//  Created by Brian J Glowe on 11/6/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
        
        func showErrorView(error: NSError) {
            if let errorMessage = error.userInfo["error"] as? String {
                let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                presentViewController(alert, animated: true, completion: nil)
            }
        }
}
