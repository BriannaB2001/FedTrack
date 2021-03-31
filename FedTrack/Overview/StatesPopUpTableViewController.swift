//
//  StatesPopUpTableViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 3/26/21.
//

import UIKit

class StatesPopUpTableViewController: UITableViewController {
    
    var specificBill = [SpecificBill]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let string = "Alabama"
            let other = States.init(rawValue: string)
            print(other)
    
    }
    
    var stateDelegate: StateChosen?
    
    // MARK: - Table view data source

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.frame = CGRect(x: CGFloat(45), y: CGFloat(70), width: CGFloat(275), height: CGFloat(500))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popUpData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        
        cell.textLabel?.text = popUpData[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = popUpData[indexPath.row]
        print (data)
        UserDefaults.standard.setValue(data, forKey: "state")
        self.dismiss(animated: true, completion: nil)
    }
//    
//    func subjectSorter(selectedSubject: String) -> [Bills] {
//        var newBillArray: [Bill] = []
//        let bills: [Bill] = allBills.first!.bills
//        for bill in bills {
//            if bill.primarySubject == selectedSubject {
//                newBillArray.append(bill)
//            }
//            if selectedSubject == "All" {
//                newBillArray = bills
//            }
//        }
//        print(newBillArray)
//        return [Bills( bills: newBillArray)]
//    }
    
    let popUpData = [
        States.Alabama.rawValue,
        States.Alaska.rawValue,
        States.Arizona.rawValue,
        States.Arkansas.rawValue,
        States.California.rawValue,
        States.Colorado.rawValue,
        States.Connecticut.rawValue,
        States.Deleware.rawValue,
        States.Florida.rawValue,
        States.Georgia.rawValue,
        States.Hawaii.rawValue,
        States.Idaho.rawValue,
        States.Illinois.rawValue,
        States.Indiana.rawValue,
        States.Iowa.rawValue,
        States.Kansas.rawValue,
        States.Kentucky.rawValue,
        States.Louisiana.rawValue,
        States.Maine.rawValue,
        States.Maryland.rawValue,
        States.Massachusetts.rawValue,
        States.Michigan.rawValue,
        States.Minnesota.rawValue,
        States.Mississippi.rawValue,
        States.Missouri.rawValue,
        States.Montana.rawValue,
        States.Nebraska.rawValue,
        States.Nevada.rawValue,
        States.NewHampshire.rawValue,
        States.NewJersey.rawValue,
        States.NewMexico.rawValue,
        States.NewYork.rawValue,
        States.NorthCarolina.rawValue,
        States.NorthDakota.rawValue,
        States.Ohio.rawValue,
        States.Oklahoma.rawValue,
        States.Oregon.rawValue,
        States.Pennsylvania.rawValue,
        States.RhodeIsland.rawValue,
        States.SouthCarolina.rawValue,
        States.SouthDakota.rawValue,
        States.Tennessee.rawValue,
        States.Texas.rawValue,
        States.Utah.rawValue,
        States.Vermont.rawValue,
        States.Virginia.rawValue,
        States.Washington.rawValue,
        States.WestVirginia.rawValue,
        States.Wisconsin.rawValue,
        States.Wyoming.rawValue,
    ]
    
    enum States: String {
        case Alabama
        case Alaska
        case Arizona
        case Arkansas
        case California
        case Colorado
        case Connecticut
        case Deleware
        case Florida
        case Georgia
        case Hawaii
        case Idaho
        case Illinois
        case Indiana
        case Iowa
        case Kansas
        case Kentucky
        case Louisiana
        case Maine
        case Maryland
        case Massachusetts
        case Michigan
        case Minnesota
        case Mississippi
        case Missouri
        case Montana
        case Nebraska
        case Nevada
        case NewHampshire
        case NewJersey
        case NewMexico
        case NewYork
        case NorthCarolina
        case NorthDakota
        case Ohio
        case Oklahoma
        case Oregon
        case Pennsylvania
        case RhodeIsland
        case SouthCarolina
        case SouthDakota
        case Tennessee
        case Texas
        case Utah
        case Vermont
        case Virginia
        case Washington
        case WestVirginia
        case Wisconsin
        case Wyoming
        
        var apiName: String {
            switch self {
            case .Alabama:
                return "AL"
            case .Alaska:
                return "AK"
            case .Arizona:
                return "AZ"
            case .Arkansas:
                return "AR"
            case .California:
                return "CA"
            case .Colorado:
                return "CO"
            case .Connecticut:
                return "CT"
            case .Deleware:
                return "DE"
            case .Florida:
                return "FL"
            case .Georgia:
                return "GA"
            case .Hawaii:
                return "HI"
            case .Idaho:
                return "ID"
            case .Illinois:
                return "IL"
            case .Indiana:
                return "IN"
            case .Iowa:
                return "IA"
            case .Kansas:
                return "KS"
            case .Kentucky:
                return "KY"
            case .Louisiana:
                return "LA"
            case .Maine:
                return "ME"
            case .Maryland:
                return "MD"
            case .Massachusetts:
                return "MA"
            case .Michigan:
                return "MI"
            case .Minnesota:
                return "MN"
            case .Mississippi:
                return "MS"
            case .Missouri:
                return "MO"
            case .Montana:
                return "MT"
            case .Nebraska:
                return "NE"
            case .Nevada:
                return "NV"
            case .NewHampshire:
                return "NH"
            case .NewJersey:
                return "NJ"
            case .NewMexico:
                return "NM"
            case .NewYork:
                return "NY"
            case .NorthCarolina:
                return "NC"
            case .NorthDakota:
                return "ND"
            case .Ohio:
                return "OH"
            case .Oklahoma:
                return "OK"
            case .Oregon:
                return "OR"
            case .Pennsylvania:
                return "PA"
            case .RhodeIsland:
                return "RI"
            case .SouthCarolina:
                return "SC"
            case .SouthDakota:
                return "SD"
            case .Tennessee:
                return "TN"
            case .Texas:
                return "TX"
            case .Utah:
                return "UT"
            case .Vermont:
                return "VT"
            case .Virginia:
                return "VA"
            case .Washington:
                return "WA"
            case .WestVirginia:
                return "WV"
            case .Wisconsin:
                return "WI"
            case .Wyoming:
                return "WY"
                
            }
        }
    }

}

protocol StateChosen {
    func stateSenators(bill: [SpecificBill])
}
