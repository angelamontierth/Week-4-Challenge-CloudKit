//
//  CloudKitManager.swift
//  Week 4 Challenge CloudKit
//
//  Created by Angela Montierth on 3/10/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import Foundation
import CloudKit


class CloudKitManager {
    
    //=======================================================
    // MARK: - obtain public database
    //=======================================================
    
    
    let publicDB = CKContainer.default().publicCloudDatabase
    
    
    //=======================================================
    // MARK: - Save Record
    //=======================================================
    
    func saveRecord(record: CKRecord, completion: @escaping () -> Void) {
        publicDB.save(record) { (_, error) in
            
            if let error = error {
                print(error)
                completion()
                return
            }
            print("Successfully saved record to CloudKit")
            completion()
        }
        
    }
        
    //=======================================================
    // MARK: - Fetch Records
    //=======================================================

    func fetchRecords(type: String, completion: @escaping([CKRecord]) -> Void ) {
        
        let predicate = NSPredicate(value: true)
        
        let query = CKQuery(recordType: type, predicate: predicate)
        
        publicDB.perform(query, inZoneWith: nil) { (returnedRecords, error) in
            
            if let error = error {
                print(error)
                completion([])
                return
            }
            
            guard let records = returnedRecords else { completion([]); return }
            completion(records)
        }
    }
    
    
}

















