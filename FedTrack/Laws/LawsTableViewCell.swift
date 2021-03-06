//
//  LawsTableViewCell.swift
//  FedTrack
//
//  Created by Brianna Babcock on 3/2/21.
//

import UIKit

class LawsTableViewCell: UITableViewCell {

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
    
        
    }

}
