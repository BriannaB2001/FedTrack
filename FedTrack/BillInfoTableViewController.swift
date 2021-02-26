//
//  BillInfoTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/11/21.
//

import UIKit

class BillInfoTableViewController: UITableViewController {
    
    @IBOutlet weak var billInfoNumberLabel: UILabel!
    @IBOutlet weak var billInfoNameLabel: UILabel!
    @IBOutlet weak var billInfoSummaryLabel: UILabel!
    
    @IBOutlet weak var billInfoHouseImage: UIImageView!
    @IBOutlet weak var billInfoSenateImage: UIImageView!
    @IBOutlet weak var billInfoPresidentImage: UIImageView!
    @IBOutlet weak var billInfoProgressView: UIProgressView!
    @IBOutlet weak var latestActionDateLabel: UILabel!
    @IBOutlet weak var sponsorNameLabel: UILabel!
    
    @IBOutlet weak var billInfoHouseHeight: NSLayoutConstraint!
    @IBOutlet weak var billInfoHouseWidth: NSLayoutConstraint!
    @IBOutlet weak var billInfoSenateWidth: NSLayoutConstraint!
    @IBOutlet weak var billInfoSenateHeight: NSLayoutConstraint!
    @IBOutlet weak var billInfoPresidentWidth: NSLayoutConstraint!
    @IBOutlet weak var billInfoPresidentHeight: NSLayoutConstraint!
    @IBOutlet weak var billInfoHouseTopBillNameBottom: NSLayoutConstraint!
    @IBOutlet weak var billInfoSenateTopBillNameBottom: NSLayoutConstraint!
    @IBOutlet weak var billInfoPresidentTopBillNameBottom: NSLayoutConstraint!

    var billInfo: Bill?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let billInfo = billInfo {
            billInfoNumberLabel?.text = "\(billInfo.number)"
            billInfoNameLabel?.text = "\(billInfo.shortTitle)"
            billInfoSummaryLabel?.text = "\(billInfo.summary)"
            latestActionDateLabel?.text = "\(billInfo.latestActionDate)"
            sponsorNameLabel?.text = "\(billInfo.sponsorName)"
            
            
            
            if billInfo.summary.isEmpty {
                billInfoSummaryLabel?.text = "Summary N/A"
            }
        }
        updateImage(bill: billInfo!)
    }
    
    func updateImage(bill: Bill) {
        
        if let house = bill.house  {
            billInfoHouseImage.image = UIImage(named: "BlueHouse")
            billInfoHouseWidth.constant = 85
            billInfoHouseHeight.constant = 87
            billInfoHouseTopBillNameBottom.constant = 1
            
        } else {
            billInfoHouseImage.image = UIImage(named: "GreyHouse")
            billInfoHouseWidth.constant = 93
            billInfoHouseHeight.constant = 103
        }
        
        if let senate = bill.senate  {
            billInfoSenateImage.image = UIImage(named: "BlueSenate")
            billInfoSenateWidth.constant = 103
            billInfoSenateHeight.constant = 118
            billInfoSenateTopBillNameBottom.constant = -17
            
        } else {
            billInfoSenateImage.image = UIImage(named: "GreySenate")
            billInfoSenateWidth.constant = 86
            billInfoSenateHeight.constant = 80
            billInfoSenateTopBillNameBottom.constant = -5
        }
        
        if let enacted = bill.enacted  {
            billInfoPresidentImage.image = UIImage(named: "BluePresident")
            billInfoPresidentWidth.constant = 117
            billInfoPresidentHeight.constant = 117
            billInfoPresidentTopBillNameBottom.constant = -19
            
        } else {
            billInfoPresidentImage.image = UIImage(named: "GreyPresident")
            billInfoPresidentWidth.constant = 109
            billInfoPresidentHeight.constant = 99
        }
    }
}
