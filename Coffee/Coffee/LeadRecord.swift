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
    @NSManaged var leadName: String?
    @NSManaged var leadContactInfo: String?
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













