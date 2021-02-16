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
            progressView.progress = 0.4
            houseImage.frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)

        } else {
            houseImage.image = UIImage(named: "GreyHouse")
        }
        
        if let senate = bill.senate  {
           senateImage.image = UIImage(named: "BlueSenate")
            progressView.progress = 0.7
           
        } else {
            senateImage.image = UIImage(named: "GreySenate")
        }
        
        if let enacted = bill.enacted  {
            presidentImage.image = UIImage(named: "BluePresident")
            progressView.progress = 1.0
        } else {
            presidentImage.image = UIImage(named: "GreyPresident")
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
