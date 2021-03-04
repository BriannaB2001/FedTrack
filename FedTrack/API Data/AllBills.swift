//
//  AllBills.swift
//  FedTrack
//
//  Created by Brianna Babcock on 2/4/21.
//

import Foundation

struct Bill: Codable {
    var number: String
    var shortTitle: String
    var summary: String
    var primarySubject: String
    var latestActionDate: String
    var latestAction: String
    var sponsorTitle: String
    var sponsorName: String
    var committee: Bool
    var house: String?
    var senate: String?
    var enacted: String?
    
    enum CodingKeys: String, CodingKey {
        case number = "number"
        case shortTitle = "short_title"
        case summary = "summary"
        case primarySubject = "primary_subject"
        case latestActionDate = "latest_major_action_date"
        case latestAction = "latest_major_action"
        case sponsorName = "sponsor_name"
        case sponsorTitle = "sponsor_title"
        case committee = "active"
        case house = "house_passage"
        case senate = "senate_passage"
        case enacted = "enacted"
    }
}

struct AllBills: Codable {
    var results: [Bills]
}

struct Bills: Codable {
    var bills: [Bill]
}
