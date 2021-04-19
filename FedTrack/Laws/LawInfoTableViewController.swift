//
//  LawInfoTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 4/19/21.
//

import UIKit
import SwiftUI

class LawInfoTableViewController: UITableViewController {
        
        @IBOutlet weak var summaryLabel: UILabel!
        @IBOutlet weak var viewForImages: UIView!
        
        var billInfo: Bill?
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            if let billInfo = billInfo {
                
                let congressView = UIHostingController(rootView: ContentView(committee: billInfo.committee, house: (billInfo.house != nil), senate: (billInfo.senate != nil), enacted: (billInfo.enacted != nil), billName: billInfo.shortTitle, isFavorited: true, billSubject: billInfo.primarySubject ))
                congressView.view.frame = viewForImages.bounds
                viewForImages.addSubview(congressView.view)
                congressView.view.translatesAutoresizingMaskIntoConstraints = false
                congressView.view.leadingAnchor.constraint(equalTo: viewForImages.leadingAnchor).isActive = true
                congressView.view.trailingAnchor.constraint(equalTo: viewForImages.trailingAnchor).isActive = true
                congressView.view.topAnchor.constraint(equalTo: viewForImages.topAnchor).isActive = true
                congressView.view.bottomAnchor.constraint(equalTo: viewForImages.bottomAnchor).isActive = true

                summaryLabel?.text = "\(billInfo.summary)"
                
                if billInfo.summary.isEmpty {
                    summaryLabel?.text = "Summary N/A"
                }
            }
        }
    }
        
