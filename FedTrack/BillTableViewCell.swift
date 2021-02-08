//
//  BillTableViewCell.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/8/21.
//

import UIKit

class BillTableViewCell: UITableViewCell {

    @IBOutlet weak var billNumberLabel: UILabel!
    @IBOutlet weak var billNameLabel: UILabel!
    @IBOutlet weak var billTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell (bill: Bill) {
        
        billNumberLabel?.text = "\(bill.number)"
        billNameLabel?.text = "\(bill.shortTitle)"
        billTypeLabel?.text = "\(bill.primarySubject)"
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
