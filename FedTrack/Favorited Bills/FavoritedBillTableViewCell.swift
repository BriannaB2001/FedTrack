//
//  FavoritedBillTableViewCell.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/26/21.
//

import UIKit

class FavoritedBillTableViewCell: UITableViewCell {

    @IBOutlet weak var favoritedBillNumberLabel: UILabel!
    @IBOutlet weak var billNameLabel: UILabel!
    @IBOutlet weak var billTypeLabel: UILabel!
    @IBOutlet weak var billNumberLabel: UILabel!
    
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
}

