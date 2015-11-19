//
//  LeadRecord.swift
//  Coffee
//
//  Created by Brian J Glowe on 11/6/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import Foundation
import Parse

class LeadRecord: PFObject {
    
// this class is not doing anything right now (11/8/15)
//  the comments on each NSManaged Obejct line are the property names of the Parse objects
    
    @NSManaged var leadName: String?            // "leadName"
    @NSManaged var leadContactInfo: String?     // "leadContactEmail"
    @NSManaged var leadCompany: String?         // "leadCompany"
    @NSManaged var leadPhone: String?           // "leadPhone"
    @NSManaged var leadRating: Int             // "leadRating"
    @NSManaged var leadComments: String?        // "leadComments"
    @NSManaged var createdBy: PFUser
//    @NSManaged var sentTo: PFUser

    init(leadName: String?, contactInfo: String?, createdBy: PFUser) {
        super.init()
        
        self.leadName = leadName
        self.leadContactInfo = contactInfo
        self.createdBy = createdBy
    }
    
    override init() {
        super.init()
    }    
    
    override class func query() -> PFQuery? {
        let query = PFQuery(className: LeadRecord.parseClassName())
    //request this query returns will full user details
        query.includeKey("user")
        query.orderByDescending("createdAt")
        return query
    }
}

extension LeadRecord: PFSubclassing {
 // this sets the name of the object on the backend in Parse
    class func parseClassName() -> String {
        return "LeadRecord"
    }
 // letting Parse know this subclass will be used for all LeadRecord types. we are only doing this once
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
}













