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
    
    var specificBill: Bill?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let specificBill = specificBill {
            specificBillNumberLabel?.text = "\(specificBill.number)"
            specificBillNameLabel?.text = "\(specificBill.shortTitle)"
        }
        
        updateImage(bill: specificBill!)
        
    }
    
    func updateImage(bill: Bill) {
        
        if let house = bill.house  {
            specificBillHouseImage.image = UIImage(named: "BlueHouse")
            specificBillProgressView.progress = 0.38
            specificBillHouseWidth.constant = 80
            specificBillHouseHeight.constant = 87
            
        } else {
            specificBillHouseImage.image = UIImage(named: "GreyHouse")
        }
        
        if let senate = bill.senate  {
            specificBillSenateImage.image = UIImage(named: "BlueSenate")
            specificBillProgressView.progress = 0.7
            specificBillSenateWidth.constant = 105
            specificBillSenateHeight.constant = 110
            //            senateTopBillNameBottom.constant = 8
            //            senateLeadingHouseTrailing.constant = 0
            
        } else {
            specificBillSenateImage.image = UIImage(named: "GreySenate")
        }
        
        if let enacted = bill.enacted  {
            specificBillPresidentImage.image = UIImage(named: "BluePresident")
            specificBillProgressView.progress = 1.0
            specificBillPresidentWidth.constant = 120
            specificBillPresidentHeight.constant = 120
            //presidentTopBillNameBottom.constant = -18
        } else {
            specificBillPresidentImage.image = UIImage(named: "GreyPresident")
        }
        
    }
    
    
    
    
    //    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return UITableView.automaticDimension
    //    }
    //
    //    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 100
    //
    //    }
}
