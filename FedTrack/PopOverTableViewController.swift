//
//  PopOverTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/25/21.
//

import UIKit

class PopOverTableViewController: UITableViewController {
    
    var subjects = ["Goverment Operation and Politics", "Civils Rights and Liberties, Minority Issues", ]
    var allBills = [Bill]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Table view data source
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.frame = CGRect(x: CGFloat(45), y: CGFloat(70), width: CGFloat(275), height: CGFloat(500))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subjects.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "popupCell", for: indexPath)
        
        cell.textLabel?.text = subjects[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
//    func subjectSorter() {
//
//        for bill in allBills {
//        if bill.primarySubject == selectedSubject {
//        newBillArray.append(bill)
//        }
//        }
//    }
    
}
