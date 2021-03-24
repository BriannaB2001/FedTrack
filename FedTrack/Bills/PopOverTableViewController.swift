//
//  PopOverTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/25/21.
//

import UIKit

class PopOverTableViewController: UITableViewController {
    
    var subjects = ["All", "Agriculture and Food", "Animals", "Armed Forces and National security", "Arts, Culture, Religion", "Civil Rights and Liberties, Minority Issues", "Commerce", "Crime and Law Enforcement", "Economics and Public Finance", " Education", "Emergency Management", "Energy", "Environment Protection", "Families", "Finance and Financial Sector", "Foreign Trade and International Finance", " Geographic Areas, Entities, and Committees", "Government Operations and Politics", "Health", "Housing and Community Development", "Immigration", "International Affairs", "Labor and Employment", "Law", "Native Amercians", "Private Legislation", "Public Lands and Natural Resources", "Science, Technology, Communications", "Social Sciences and History", "Social Welfare", "Sports and Recreation","Taxation", "Transportation and Public works", "Water Resources Development"]
    
    var allBills = [Bills]()
    
    var subjectDelegate: SubjectChosen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AllBillsURLController.fetchBillsItems { (bills) in
            DispatchQueue.main.async {
                self.allBills = bills ?? []
                self.tableView.reloadData()
            }
        }
        
    }
    
    // MARK: - Table view data source
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.frame = CGRect(x: CGFloat(45), y: CGFloat(70), width: CGFloat(275), height: CGFloat(500))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "popupCell", for: indexPath)
        
        cell.textLabel?.text = subjects[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subject = subjects[indexPath.row]
        print (subject)
        let billsForSubjects = subjectSorter(selectedSubject: subject)
        subjectDelegate?.subjectBills(bill: billsForSubjects)
        self.dismiss(animated: true, completion: nil)
    }
    
    func subjectSorter(selectedSubject: String) -> [Bills] {
        var newBillArray: [Bill] = []
        let bills: [Bill] = allBills.first!.bills
        for bill in bills {
            if bill.primarySubject == selectedSubject {
                newBillArray.append(bill)
            }
            if selectedSubject == "All" {
                newBillArray = bills
            }
        }
        print(newBillArray)
        return [Bills( bills: newBillArray)]
    }
}

protocol SubjectChosen {
    func subjectBills(bill: [Bills])
}
