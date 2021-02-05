//
//  AllBillsTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/5/21.
//

import UIKit

class AllBillsTableViewController: UITableViewController {
    
    @IBOutlet weak var billNumberLabel: UILabel!
    @IBOutlet weak var billNameLabel: UILabel!
    @IBOutlet weak var billTypeLabel: UILabel!
    
    var allBills = [Bill]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {

        let allBill = allBills[indexPath.row]

        billNumberLabel?.text = "\(allBill.number)"
        billNameLabel?.text = "\(allBill.shortTitle)"
        billTypeLabel?.text = "\(allBill.primarySubject)"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allBills.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "billInfo", for: indexPath)

        configure(cell: cell, forItemAt: indexPath)

        return cell
    }
}
