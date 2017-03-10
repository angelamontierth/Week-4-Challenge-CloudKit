//
//  ContactDetailViewController.swift
//  Week 4 Challenge CloudKit
//
//  Created by Angela Montierth on 3/10/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    var contact: Contact?
    
    //=======================================================
    // MARK: - OUTLETS
    //=======================================================
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //=======================================================
    // MARK: - ACTIONS
    //=======================================================
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let name = nameTextField.text,
            let phone = phoneTextField.text,
            let email = emailTextField.text
            else { return }
        
        
            ContactController.shared.saveRecordToCloudKit(name: name, phone: phone, email: email) {
                DispatchQueue.main.async {
                    let _ = self.navigationController?.popViewController(animated: true)
                }
        }
    }
}
