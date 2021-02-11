//
//  SpecificBillTitleTableViewCell.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/11/21.
//

import UIKit

class SpecificBillTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var specificBillNumberLabel: UILabel!
    @IBOutlet weak var specificBillNameLabel: UILabel!
    @IBOutlet weak var specificBillTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateTitleCell (bill: Bill) {
        specificBillNumberLabel?.text = "\(bill.number)"
        specificBillNameLabel?.text = "\(bill.shortTitle)"
        specificBillTypeLabel?.text = "\(bill.primarySubject)"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
