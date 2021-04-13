//
//  BillTableViewCell.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/8/21.
//

import UIKit

class BillsTableViewCell: UITableViewCell {
    
    var allBills = [Bills]()
    
    @IBOutlet weak var billNumberLabel: UILabel!
    @IBOutlet weak var billNameLabel: UILabel!
    @IBOutlet weak var billTypeLabel: UILabel!
    
    @IBOutlet weak var favoritedButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell (bill: Bill) {
        
        billNumberLabel?.text = "\(bill.number)"
        billNameLabel?.text = "\(bill.shortTitle)"
        billTypeLabel?.text = "\(bill.primarySubject)"
        
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    @IBAction func saveBillButtonTapped(_ sender: Any) {
        
//        let currentCatFactText = allBills[catFactIndex].text
//        if let existingEntry =  CoreDataManager.shared.entryForText(text: currentCatFactText ) {
//            CoreDataManager.shared.deleteEntry(entry: existingEntry)
//            favoritedButton.isSelected = false
//        } else {
//            CoreDataManager.shared.createNewEntry(text: allBills[catFactIndex].text, type: .catFact)
//            favoritedButton.isSelected = true
//        }
        
    }
    
}
