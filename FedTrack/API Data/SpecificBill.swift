//
//  SpecificBill.swift
//  FedTrack
//
//  Created by Brianna Babcock on 3/16/21.
//

import Foundation

struct SpecificBills: Codable {
    var results: SpecificBill
}

struct SpecificBill: Codable {
    var votes: SpecificVotes
}

struct SpecificVotes: Codable {
    var vote: SpecificVote
}

struct Total: Codable {
    var yes: String
    var no: String
}

struct SpecificVote: Codable {
    var total: Total
    var positions: [Positions]
    
    enum CodingKeys: String, CodingKey {
        case positions = "positions"
        case total = "total"
    }
}

struct Positions: Codable {
    var name: String
//    var votePosition: String
    var state: String
    
    enum Codingkeys: String, CodingKey {
        case name = "name"
//        case votePosition = "vote_position"
        case state = "state"
    }
}


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
