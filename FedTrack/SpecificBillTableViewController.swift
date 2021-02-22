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
    @IBOutlet weak var specificBillSummaryLabel: UILabel!
    
    @IBOutlet weak var specificBillHouseImage: UIImageView!
    @IBOutlet weak var specificBillSenateImage: UIImageView!
    @IBOutlet weak var specificBillPresidentImage: UIImageView!
    @IBOutlet weak var specificBillProgressView: UIProgressView!
    
    @IBOutlet weak var specificBillHouseHeight: NSLayoutConstraint!
    @IBOutlet weak var specificBillHouseWidth: NSLayoutConstraint!
    @IBOutlet weak var specificBillSenateWidth: NSLayoutConstraint!
    @IBOutlet weak var specificBillSenateHeight: NSLayoutConstraint!
    @IBOutlet weak var specificBillPresidentWidth: NSLayoutConstraint!
    @IBOutlet weak var specificBillPresidentHeight: NSLayoutConstraint!
    @IBOutlet weak var specificHouseTopBillNameBottom: NSLayoutConstraint!
    @IBOutlet weak var specificSenateTopBillNameBottom: NSLayoutConstraint!
    @IBOutlet weak var specificPresidentTopBillNameBottom: NSLayoutConstraint!
    @IBOutlet weak var lastVoteDateLabel: UILabel!
    
    var specificBill: Bill?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let specificBill = specificBill {
            specificBillNumberLabel?.text = "\(specificBill.number)"
            specificBillNameLabel?.text = "\(specificBill.shortTitle)"
            specificBillSummaryLabel?.text = "\(specificBill.summary)"
//            lastVoteDateLabel?.text = "\(specificBill.lastVote ?? "N/A")"
            
//            if Bill.summary == true { specificBillSummaryLabel?.text = "\(specificBill.summary)"
//
//            }
//            else {
//                specificBillNumberLabel?.text = "Summary N/A"
//            }
            
            
        }
        
        updateImage(bill: specificBill!)
        //        tableView.rowHeight = UITableView.automaticDimension
        //        tableView.estimatedRowHeight = 44
        
    }
    
    func updateImage(bill: Bill) {
        
        if let house = bill.house  {
            specificBillHouseImage.image = UIImage(named: "BlueHouse")
            specificBillProgressView.progress = 0.38
            specificBillHouseWidth.constant = 85
            specificBillHouseHeight.constant = 87
            specificHouseTopBillNameBottom.constant = 1
            
        } else {
            specificBillHouseImage.image = UIImage(named: "GreyHouse")
            specificBillHouseWidth.constant = 93
            specificBillHouseHeight.constant = 103
        }
        
        if let senate = bill.senate  {
            specificBillSenateImage.image = UIImage(named: "BlueSenate")
            specificBillProgressView.progress = 0.7
            specificBillSenateWidth.constant = 103
            specificBillSenateHeight.constant = 118
            specificSenateTopBillNameBottom.constant = -17
            
        } else {
            specificBillSenateImage.image = UIImage(named: "GreySenate")
            specificBillSenateWidth.constant = 86
            specificBillSenateHeight.constant = 80
            specificSenateTopBillNameBottom.constant = -5
        }
        
        if let enacted = bill.enacted  {
            specificBillPresidentImage.image = UIImage(named: "BluePresident")
            specificBillProgressView.progress = 1.0
            specificBillPresidentWidth.constant = 117
            specificBillPresidentHeight.constant = 117
            specificPresidentTopBillNameBottom.constant = -19
            
        } else {
            specificBillPresidentImage.image = UIImage(named: "GreyPresident")
            specificBillPresidentWidth.constant = 109
            specificBillPresidentHeight.constant = 99
        }
        
    }
    
    
    //        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //            return UITableView.automaticDimension
    //        }
    //
    //        override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    //            return 100
    //
    //        }
}
