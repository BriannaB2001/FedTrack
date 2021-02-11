//
//  BillsTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/5/21.
//

import UIKit

class BillsTableViewController: UITableViewController {
    
    var allBills = [Bills]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AllBillsURLController.fetchBillsItems { (bills) in
            DispatchQueue.main.async {
                self.allBills = bills ?? []
                self.tableView.reloadData()
            }
        }
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if allBills.count > 0 {
            return allBills.first!.bills.count
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "billInfo", for: indexPath) as! BillsTableViewCell
        
        let bill = allBills.first!.bills[indexPath.row]
        cell.updateCell(bill: bill)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt
    indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(90)
       
        return normalCellHeight
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BillsToSpecificBill" {
            let specificBillTableViewController = segue.destination as!
            SpecificBillTableViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedResult = allBills[indexPath.row]
            specificBillTableViewController.specificBills = selectedResult
        }
    }
    
    }
