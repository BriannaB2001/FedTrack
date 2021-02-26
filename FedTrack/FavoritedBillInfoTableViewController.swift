//
//  FavoritedBillInfoTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/26/21.
//

import UIKit

class FavoritedBillInfoTableViewController: UITableViewController {

    @IBOutlet weak var billNumberLabel: UILabel!
    @IBOutlet weak var billNameLabel: UILabel!
    @IBOutlet weak var billSummaryLabel: UILabel!
    
    @IBOutlet weak var billHouseImage: UIImageView!
    @IBOutlet weak var billSenateImage: UIImageView!
    @IBOutlet weak var billPresidentImage: UIImageView!
    @IBOutlet weak var billProgressView: UIProgressView!
    @IBOutlet weak var latestActionDateLabel: UILabel!
    @IBOutlet weak var sponsorNameLabel: UILabel!
    
    @IBOutlet weak var billHouseHeight: NSLayoutConstraint!
    @IBOutlet weak var billHouseWidth: NSLayoutConstraint!
    @IBOutlet weak var billSenateWidth: NSLayoutConstraint!
    @IBOutlet weak var billSenateHeight: NSLayoutConstraint!
    @IBOutlet weak var billPresidentWidth: NSLayoutConstraint!
    @IBOutlet weak var billPresidentHeight: NSLayoutConstraint!
    @IBOutlet weak var billHouseTopBillNameBottom: NSLayoutConstraint!
    @IBOutlet weak var billSenateTopBillNameBottom: NSLayoutConstraint!
    @IBOutlet weak var billPresidentTopBillNameBottom: NSLayoutConstraint!
    
    var bill: Bill?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        if let bill = bill {
//            billNumberLabel?.text = "\(bill.number)"
//            billNameLabel?.text = "\(bill.shortTitle)"
//            billSummaryLabel?.text = "\(bill.summary)"
//            latestActionDateLabel?.text = "\(bill.latestActionDate)"
//            sponsorNameLabel?.text = "\(bill.sponsorName)"
//
//
//
//            if bill.summary.isEmpty {
//                billSummaryLabel?.text = "Summary N/A"
//            }
//        }
//        updateImage(bill: bill!)
//
        
    }
    
    func updateImage(bill: Bill) {
        
        if let house = bill.house  {
            billHouseImage.image = UIImage(named: "BlueHouse")
            billHouseWidth.constant = 85
            billHouseHeight.constant = 87
            billHouseTopBillNameBottom.constant = 1
            
        } else {
            billHouseImage.image = UIImage(named: "GreyHouse")
            billHouseWidth.constant = 93
            billHouseHeight.constant = 103
        }
        
        if let senate = bill.senate  {
            billSenateImage.image = UIImage(named: "BlueSenate")
            billSenateWidth.constant = 103
            billSenateHeight.constant = 118
            billSenateTopBillNameBottom.constant = -17
            
        } else {
            billSenateImage.image = UIImage(named: "GreySenate")
            billSenateWidth.constant = 86
            billSenateHeight.constant = 80
            billSenateTopBillNameBottom.constant = -5
        }
        
        if let enacted = bill.enacted  {
            billPresidentImage.image = UIImage(named: "BluePresident")
            billPresidentWidth.constant = 117
            billPresidentHeight.constant = 117
            billPresidentTopBillNameBottom.constant = -19
            
        } else {
            billPresidentImage.image = UIImage(named: "GreyPresident")
            billPresidentWidth.constant = 109
            billPresidentHeight.constant = 99
        }
    }
}
