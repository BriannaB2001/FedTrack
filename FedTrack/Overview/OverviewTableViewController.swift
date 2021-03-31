//
//  OverviewTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 3/9/21.
//
import UIKit
import SwiftUI

class OverviewTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate, StateChosen {
    
    @IBOutlet weak var stateButton: UIBarButtonItem!
    
    func stateSenators(bill: [SpecificBill]) {
        }
    
//    override func viewWillAppear(_ animated: Bool) {
//        if let state = UserDefaults.standard.string(forKey: "state") {
//            stateButton.title = state
//        }
//    }
    
    var allBills = [Bills]()
    
    @IBAction func displayStatePopOver(_ sender: UIBarButtonItem) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Overview", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "StatesPopUpTableViewController") as! StatesPopUpTableViewController
            vc.stateDelegate = self
            vc.modalPresentationStyle = .popover
            let popover: UIPopoverPresentationController = vc.popoverPresentationController!
            popover.barButtonItem = sender
            present(vc, animated: true, completion:nil)
    }
    
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
