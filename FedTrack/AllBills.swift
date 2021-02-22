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
//    var lastVote: String?
    var sponsorName: String
    var active: String?
    var house: String?
    var senate: String?
    var enacted: String?
    
    enum CodingKeys: String, CodingKey {
        case number = "number"
        case shortTitle = "short_title"
        case summary = "summary"
        case primarySubject = "primary_subject"
//        case lastVote = "last_vote"
        case sponsorName = "sponsor_name"
        case active = "active"
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
