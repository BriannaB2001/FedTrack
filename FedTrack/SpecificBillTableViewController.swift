//
//  SpecificBillTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/11/21.
//

import UIKit

class SpecificBillTableViewController: UITableViewController {

    var specificBills = [Bills]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AllBillsURLController.fetchBillsItems { (bills) in
            DispatchQueue.main.async {
                self.specificBills = bills ?? []
                self.tableView.reloadData()
            }
        }
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! SpecificBillTitleTableViewCell
        
        let specificBill = specificBills.first!.bills[indexPath.row]
        cell.updateTitleCell(bill: specificBill)

        return cell

    }
    
}
