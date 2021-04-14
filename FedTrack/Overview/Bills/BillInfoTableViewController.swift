//
//  BillInfoTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/11/21.
//

import UIKit
import SwiftUI

class BillInfoTableViewController: UITableViewController {
    
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var viewForImages: UIView!
    
    @IBOutlet weak var latestActionDateLabel: UILabel!
    @IBOutlet weak var latestActionLabel: UILabel!
    @IBOutlet weak var yesLabel: UILabel!
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var rep1NameLabel: UILabel!
    @IBOutlet weak var rep1VoteLabel: UILabel!
    @IBOutlet weak var rep2NameLabel: UILabel!
    @IBOutlet weak var rep2VoteLabel: UILabel!
    
    var billInfo: Bill?
    var recentBills: Votes?
    var specificBill: SpecificBill?
    var rollCall: Int = 17
    var state: String = "UT"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.latestActionLabel.numberOfLines = 0
        
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
                                    if let stateFromDefaults = UserDefaults.standard.string(forKey: "state"),
                                       let abbState = self.statesDictionary[stateFromDefaults] {
                                        if position.state == abbState {
                                            peopleWhoVoted.append(position.name)
                                        }
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
            
            
//
//            let congressView = UIHostingController(rootView: ContentView(committee: billInfo.committee, house: (billInfo.house != nil), senate: (billInfo.senate != nil), enacted: (billInfo.enacted != nil), billName: billInfo.shortTitle, isFavorited: true, billSubject: billInfo.primarySubject ))
//            congressView.view.frame = viewForImages.bounds
//            viewForImages.addSubview(congressView.view)
//            congressView.view.translatesAutoresizingMaskIntoConstraints = false
//            congressView.view.leadingAnchor.constraint(equalTo: viewForImages.leadingAnchor).isActive = true
//            congressView.view.trailingAnchor.constraint(equalTo: viewForImages.trailingAnchor).isActive = true
//            congressView.view.topAnchor.constraint(equalTo: viewForImages.topAnchor).isActive = true
//            congressView.view.bottomAnchor.constraint(equalTo: viewForImages.bottomAnchor).isActive = true
            
            
            
            
            
//            numberLabel?.text = "\(billInfo.number)"
//            nameLabel?.text = "\(billInfo.shortTitle)"
            summaryLabel?.text = "\(billInfo.summary)"
            latestActionDateLabel?.text = "\(billInfo.latestActionDate)"
            latestActionLabel?.text = "\(billInfo.latestAction)"
            
            
            if billInfo.summary.isEmpty {
                summaryLabel?.text = "Summary N/A"
            }
        }
    }
    var statesDictionary = ["Alabama": "AL",
                            "Alaska": "AK",
                            "Arizona": "AZ",
                            "Arkansas": "AR",
                            "California": "CA",
                            "Colorado": "CO",
                            "Connecticut": "CT",
                            "Delaware": "DE",
                            "Florida": "FL",
                            "Georgia": "GA",
                            "Hawaii": "HI",
                            "Idaho": "ID",
                            "Illinois": "IL",
                            "Indiana": "IN",
                            "Iowa": "IA",
                            "Kansas": "KS",
                            "Kentucky": "KY",
                            "Louisiana": "LA",
                            "Maine": "ME",
                            "Maryland": "MD",
                            "Massachusetts": "MA",
                            "Michigan": "MI",
                            "Minnesota": "MN",
                            "Mississippi": "MS",
                            "Missouri": "MO",
                            "Montana": "MT",
                            "Nebraska": "NE",
                            "Nevada": "NV",
                            "New Hampshire": "NH",
                            "New Jersey": "NJ",
                            "New Mexico": "NM",
                            "New York": "NY",
                            "North Carolina": "NC",
                            "North Dakota": "ND",
                            "Ohio": "OH",
                            "Oklahoma": "OK",
                            "Oregon": "OR",
                            "Pennsylvania": "PA",
                            "Rhode Island": "RI",
                            "South Carolina": "SC",
                            "South Dakota": "SD",
                            "Tennessee": "TN",
                            "Texas": "TX",
                            "Utah": "UT",
                            "Vermont": "VT",
                            "Virginia": "VA",
                            "Washington": "WA",
                            "West Virginia": "WV",
                            "Wisconsin": "WI",
                            "Wyoming": "WY"]
}
