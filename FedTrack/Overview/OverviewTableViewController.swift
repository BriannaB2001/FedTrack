//
//  OverviewTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 3/9/21.
//
import UIKit
import SwiftUI

class OverviewTableViewController: UITableViewController {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "overviewCell", for: indexPath) as! BillsTableViewCell
        
        let bill = allBills.first!.bills[indexPath.row]
        cell.updateCell(bill: bill)
        
        let congressView = UIHostingController(rootView: ContentView(committee: bill.committee, house: (bill.house != nil), senate: (bill.senate != nil), enacted: (bill.enacted != nil), billName: bill.shortTitle, isFavorited: true, billSubject: bill.primarySubject ))
        cell.contentView.translatesAutoresizingMaskIntoConstraints = false
        congressView.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(congressView.view)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt
                                indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(90)
        
        return normalCellHeight
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "BillsToSpecificBill" {
//            let billInfoTableViewController = segue.destination as!
//                BillInfoTableViewController
//            let indexPath = tableView.indexPathForSelectedRow!
//            let selectedResult = allBills.first!.bills[indexPath.row]
//            billInfoTableViewController.billInfo = selectedResult
//        }
//    }
}

var states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]


