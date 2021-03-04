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
    
    @IBOutlet weak var committeeImage: UIImageView!
    @IBOutlet weak var committeeWidth: NSLayoutConstraint!
    @IBOutlet weak var committeeHeight: NSLayoutConstraint!
    @IBOutlet weak var committeeTopBillNameBottom: NSLayoutConstraint!
    
    @IBOutlet weak var houseImage: UIImageView!
    @IBOutlet weak var houseWidth: NSLayoutConstraint!
    @IBOutlet weak var houseHeight: NSLayoutConstraint!
    @IBOutlet weak var houseTopBillNameBottom: NSLayoutConstraint!
    
    @IBOutlet weak var senateImage: UIImageView!
    @IBOutlet weak var senateWidth: NSLayoutConstraint!
    @IBOutlet weak var senateHeight: NSLayoutConstraint!
    @IBOutlet weak var senateTopBillNameBottom: NSLayoutConstraint!
    @IBOutlet weak var senateLeadingHouseTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var presidentImage: UIImageView!
    @IBOutlet weak var presidentWidth: NSLayoutConstraint!
    @IBOutlet weak var presidentHeight: NSLayoutConstraint!
    @IBOutlet weak var presidentTopBillNameBottom: NSLayoutConstraint!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var favoritedButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell (bill: Bill) {
        
        billNumberLabel?.text = "\(bill.number)"
        billNameLabel?.text = "\(bill.shortTitle)"
        billTypeLabel?.text = "\(bill.primarySubject)"
        
    }
    
    func updateImage(bill: Bill) {
        
        if case let bill.committee = true {
            committeeImage.image = UIImage(named: "BlueC")
            committeeWidth.constant = 97
            committeeHeight.constant = 97
            committeeTopBillNameBottom.constant = 5
            
        } else {
            committeeImage.image = UIImage(named: "GreyC")
            committeeWidth.constant = 86
            committeeHeight.constant = 91
            committeeTopBillNameBottom.constant = 5
        }
        
        if let house = bill.house  {
            houseImage.image = UIImage(named: "BlueHouse")
            houseWidth.constant = 85
            houseHeight.constant = 90
            houseTopBillNameBottom.constant = 1
            
        } else {
            houseImage.image = UIImage(named: "GreyHouse")
            houseWidth.constant = 88
            houseHeight.constant = 95
            houseTopBillNameBottom.constant = -8
        }
        
        if let senate = bill.senate  {
            senateImage.image = UIImage(named: "BlueSenate")
            senateWidth.constant = 102
            senateHeight.constant = 106
            senateTopBillNameBottom.constant = -10
            senateLeadingHouseTrailing.constant = 0
            
        } else {
            senateImage.image = UIImage(named: "GreySenate")
            senateWidth.constant = 86
            senateHeight.constant = 80
            senateTopBillNameBottom.constant = -5
        }
        
        if let enacted = bill.enacted  {
            presidentImage.image = UIImage(named: "BluePresident")
            presidentWidth.constant = 120
            presidentHeight.constant = 120
            presidentTopBillNameBottom.constant = -18
        } else {
            presidentImage.image = UIImage(named: "GreyPresident")
            presidentWidth.constant = 109
            presidentHeight.constant = 99
        }
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
