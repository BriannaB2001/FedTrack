//
//  OverviewTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 3/9/21.
//
import UIKit
import SwiftUI

class OverviewTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate, SubjectChosen {
    
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
    
    // Mark: - Subject Chosen Delegate
    
    func subjectBills(bill: [Bills]) {
        allBills = bill
        tableView.reloadData()
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
        cell.updateImage(bill: bill)
        
        let congressView = UIHostingController(rootView: ContentView(committee: true, house: true, senate: true, enacted: false))
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
    
}
