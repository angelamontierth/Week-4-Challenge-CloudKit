//
//  ContactsTableViewController.swift
//  Week 4 Challenge CloudKit
//
//  Created by Angela Montierth on 3/10/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ContactController.shared.fetchRecordsFromCloudKit {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactController.shared.contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)

        let contact = ContactController.shared.contacts[indexPath.row]
        cell.textLabel?.text = contact.name
        
        return cell
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toShowContact" {
            
            if let detailViewController = segue.destination as? ContactDetailViewController,
                let selectedRow = tableView.indexPathForSelectedRow?.row {
                
                let contact = ContactController.shared.contacts[selectedRow]
                detailViewController.contact = contact
                
            }
        }
    }

}
