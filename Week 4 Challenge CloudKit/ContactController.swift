//
//  ContactController.swift
//  Week 4 Challenge CloudKit
//
//  Created by Angela Montierth on 3/10/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import Foundation
import CloudKit

class ContactController {
    
    // SINGLETON
    
    static let shared = ContactController()
    
    let cloudKitManager = CloudKitManager()
    
    // Need a place to hold the contacts once you have them
    
    var contacts: [Contact] = []
    
    //=======================================================
    // MARK: - SAVING
    //=======================================================

    func saveRecordToCloudKit(name: String, phone: String, email: String, completion: @escaping () -> Void) {
        
        let contact = Contact(name: name, phone: phone, email: email)
        let record = CKRecord(contact: contact)
        
        // Call CloudKitManager function to "save"
        // you can start writing this first and get hints on what else you need for this function
        self.contacts.append(contact)
        cloudKitManager.saveRecord(record: record) {
            completion()
        }
        
    }
    
    //=======================================================
    // MARK: - FETCH RECORDS
    //=======================================================

    func fetchRecordsFromCloudKit(completion: @escaping () -> Void) {
        
        cloudKitManager.fetchRecords(type: "Contact") { (records) in
            // in this flatmap use the failable initilizer to initialize a Contact
            
            let contacts = records.flatMap({ Contact(record: $0) })
            self.contacts = contacts
            completion()
        }
    }
}
