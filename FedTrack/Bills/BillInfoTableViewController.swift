//
//  BillInfoTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/11/21.
//

import UIKit
import SwiftUI

class BillInfoTableViewController: UITableViewController {
    
    @IBOutlet weak var nameContentView: UIView!
    
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
    @IBOutlet weak var yesLabel: UILabel!
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var repNameLabel: UILabel!
    @IBOutlet weak var repVoteLabel: UILabel!
    
    var billInfo: Bill?
    var recentBills: Votes?
    var specificBill: SpecificBill?
    var rollCall: Int = 17
    var state: String = "UT"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        RecentVotesURLController.fetchRecentVotesItems() { (bills) in
            DispatchQueue.main.async {
                self.recentBills = bills
                guard let recentBillsForVotes = self.recentBills else {fatalError()}
                for bill in recentBillsForVotes.votes {
                    if bill.bill.number == self.billInfo?.number {
                        print ("we found a match")
                        SpecificBillURLController.fetchSpecificBillItems(rollCall: bill.rollCall) { (bills) in
                            DispatchQueue.main.async {
                                self.specificBill = bills
                                self.yesLabel?.text = "\(self.specificBill!.votes.vote.total.yes)"
                                self.noLabel?.text = "\(self.specificBill!.votes.vote.total.no)"
                                var peopleWhoVoted: [String] = []
                                for position in self.specificBill!.votes.vote.positions {
                                    if position.state == self.state {
                                        peopleWhoVoted.append(position.name)
                                    }
                                }
                                print(peopleWhoVoted)
                                //self.specificVote = bills ?? []
                                self.tableView.reloadData()
                            }
                        }
                        
                    }
                    self.tableView.reloadData()
                }
            }
        }
        
        if let billInfo = billInfo {
            nameContentView.addSubview(UIHostingController(rootView: ContentView(committee: billInfo.committee, house: billInfo.house, senate: billInfo.senate, enacted: billInfo.enacted, billName: billInfo.sponsorName, isFavorited: true, billSubject: billInfo.primarySubject)).view)
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
