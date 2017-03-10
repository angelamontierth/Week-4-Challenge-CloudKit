//
//  Contact.swift
//  Week 4 Challenge CloudKit
//
//  Created by Angela Montierth on 3/10/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import Foundation
import CloudKit


class Contact {
    
    let name: String
    let phone: String?
    let email: String?
    var recordID: CKRecordID? = nil
    
    init(name: String, phone: String?, email: String?) {
        self.name = name
        self.phone = phone
        self.email = email
    }
    
    
    //=======================================================
    // MARK: -  CKRecord -> Model Object
    //=======================================================
    
    init?(record: CKRecord) {
        
        guard let name = record["name"] as? String
            else { return nil }
        
        let phone = record["phone"] as? String ?? nil
        let email = record["email"] as? String ?? nil
        
        self.name = name
        self.phone = phone
        self.email = email
        
    }
    
}
    //=======================================================
    // MARK: - Model Object -> CKRecord
    //=======================================================

extension CKRecord {
    
    convenience init(contact: Contact) {
        // if the contact already has a CKRecordID, use it. If not, create one
        let recordID = contact.recordID ?? CKRecordID(recordName: UUID().uuidString)
        // initialize a CKRecord of type message and give it a recordID
        self.init(recordType: "Contact", recordID: recordID)
        // self refers to the CKRecord
        self.setValue(contact.name, forKey: "name")
        self.setValue(contact.phone, forKey: "phone")
        self.setValue(contact.email, forKey: "email")
    }
    
}


