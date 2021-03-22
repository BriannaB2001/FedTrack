//
//  BillInfoTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/11/21.
//

import UIKit

class BillInfoTableViewController: UITableViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var committeeWidth: NSLayoutConstraint!
    @IBOutlet weak var committeeHeight: NSLayoutConstraint!
    @IBOutlet weak var committeeTopBillNameBottom: NSLayoutConstraint!
    
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
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var latestActionDateLabel: UILabel!
    @IBOutlet weak var latestActionLabel: UILabel!
    @IBOutlet weak var yeaNayLabel: UILabel!
    @IBOutlet weak var repNameLabel: UILabel!
    @IBOutlet weak var repVoteLabel: UILabel!
    
    var billInfo: Bill?
    var recentBills: [Votes] = []
    var specificVote: SpecificVote?
    var rollCall: Int = 17
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RecentVotesURLController.fetchRecentVotesItems() { (bills) in
            DispatchQueue.main.async {
                self.recentBills = bills ?? []
                self.tableView.reloadData()
            }
        }
        
        SpecificBillURLController.fetchSpecificBillItems(rollCall: rollCall) { (bills) in
            DispatchQueue.main.async {
                self.specificVote = bills ?? []
                self.tableView.reloadData()
            }
        }
        
        if let billInfo = billInfo, let specificVote = specificVote {
            numberLabel?.text = "\(billInfo.number)"
            nameLabel?.text = "\(billInfo.shortTitle)"
           summaryLabel?.text = "\(billInfo.summary)"
            latestActionDateLabel?.text = "\(billInfo.latestActionDate)"
            latestActionLabel?.text = "\(billInfo.latestAction)"
            
            if billInfo.summary.isEmpty {
                summaryLabel?.text = "Summary N/A"
            }
        }
//        updateImage(bill: billInfo!)
    }
    
//    func updateImage(bill: Bill) {
//
//        if case let bill.committee = true {
//            committeeImage.image = UIImage(named: "BlueC")
//            committeeWidth.constant = 97
//            committeeHeight.constant = 97
//            committeeTopBillNameBottom.constant = 5
//
//        } else {
//            committeeImage.image = UIImage(named: "GreyC")
//            committeeWidth.constant = 86
//            committeeHeight.constant = 91
//            committeeTopBillNameBottom.constant = 5
//        }
//
//
//        if let house = bill.house  {
//            houseImage.image = UIImage(named: "BlueHouse")
//            houseWidth.constant = 85
//            houseHeight.constant = 87
//            houseTopBillNameBottom.constant = 1
//
//        } else {
//            houseImage.image = UIImage(named: "GreyHouse")
//            houseWidth.constant = 93
//           houseHeight.constant = 103
//        }
//
//        if let senate = bill.senate  {
//            senateImage.image = UIImage(named: "BlueSenate")
//            senateWidth.constant = 103
//            senateHeight.constant = 118
//            senateTopBillNameBottom.constant = -17
//
//        } else {
//            senateImage.image = UIImage(named: "GreySenate")
//            senateWidth.constant = 86
//            senateHeight.constant = 80
//            senateTopBillNameBottom.constant = -5
//        }
//
//        if let enacted = bill.enacted  {
//            presidentImage.image = UIImage(named: "BluePresident")
//            presidentWidth.constant = 117
//            presidentHeight.constant = 117
//            presidentTopBillNameBottom.constant = -19
//
//        } else {
//            presidentImage.image = UIImage(named: "GreyPresident")
//            presidentWidth.constant = 109
//            presidentHeight.constant = 99
//        }
//    }
}
