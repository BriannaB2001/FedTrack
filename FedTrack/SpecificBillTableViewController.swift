//
//  SpecificBillTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/11/21.
//

import UIKit

class SpecificBillTableViewController: UITableViewController {
    
    @IBOutlet weak var specificBillNumberLabel: UILabel!
    @IBOutlet weak var specificBillNameLabel: UILabel!
    @IBOutlet weak var specificBillTypeLabel: UILabel!
    
    var specificBill: Bill?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let specificBill = specificBill {
            specificBillNumberLabel?.text = "\(specificBill.number)"
            specificBillNameLabel?.text = "\(specificBill.shortTitle)"
            specificBillTypeLabel?.text = "\(specificBill.primarySubject)"
        }
        
    }
}
