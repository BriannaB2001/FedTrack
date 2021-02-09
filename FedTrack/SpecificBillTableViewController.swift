//
//  SpecificBillTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/9/21.
//

import UIKit

class SpecificBillTableViewController: UITableViewController {
    
    @IBOutlet weak var specificBillNumberLabel: UILabel!
    @IBOutlet weak var specificBillNameLabel: UILabel!
    @IBOutlet weak var specificBillTypeLabel: UILabel!
    @IBOutlet weak var specificBillSummaryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

         Configure the cell...

        return cell
    }
    

    

   


}
