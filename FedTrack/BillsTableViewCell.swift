//
//  BillTableViewCell.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/8/21.
//

import UIKit

class BillsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var billNumberLabel: UILabel!
    @IBOutlet weak var billNameLabel: UILabel!
    @IBOutlet weak var billTypeLabel: UILabel!
    
    
    @IBOutlet weak var houseImage: UIImageView!
    @IBOutlet weak var senateImage: UIImageView!
    @IBOutlet weak var presidentImage: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var houseWidth: NSLayoutConstraint!
    @IBOutlet weak var houseHeight: NSLayoutConstraint!
    @IBOutlet weak var houseTopBillNameBottom: NSLayoutConstraint!
    @IBOutlet weak var senateWidth: NSLayoutConstraint!
    @IBOutlet weak var senateHeight: NSLayoutConstraint!
    @IBOutlet weak var senateTopBillNameBottom: NSLayoutConstraint!
    @IBOutlet weak var senateLeadingHouseTrailing: NSLayoutConstraint!
    @IBOutlet weak var presidentWidth: NSLayoutConstraint!
    @IBOutlet weak var presidentHeight: NSLayoutConstraint!
    @IBOutlet weak var presidentTopBillNameBottom: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell (bill: Bill) {
        
        billNumberLabel?.text = "\(bill.number)"
        billNameLabel?.text = "\(bill.shortTitle)"
        billTypeLabel?.text = "\(bill.primarySubject)"
        
    }
    
    func updateImage(bill: Bill) {
        
        if let house = bill.house  {
            houseImage.image = UIImage(named: "BlueHouse")
            progressView.progress = 0.38
            houseWidth.constant = 80
            houseHeight.constant = 87
            houseTopBillNameBottom.constant = -4
            
        } else {
            houseImage.image = UIImage(named: "GreyHouse")
        }
        
        if let senate = bill.senate  {
            senateImage.image = UIImage(named: "BlueSenate")
            progressView.progress = 0.7
            senateWidth.constant = 105
            senateHeight.constant = 110
            senateTopBillNameBottom.constant = 8
            senateLeadingHouseTrailing.constant = 0
            
        } else {
            senateImage.image = UIImage(named: "GreySenate")
        }
        
        if let enacted = bill.enacted  {
            presidentImage.image = UIImage(named: "BluePresident")
            progressView.progress = 1.0
            presidentWidth.constant = 120
            presidentHeight.constant = 120
            presidentTopBillNameBottom.constant = -18
        } else {
            presidentImage.image = UIImage(named: "GreyPresident")
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
