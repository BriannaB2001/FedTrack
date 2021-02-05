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
    var lastVote: String
    var sponsorName: String
    
    enum CodingKeys: String, CodingKey {
        case number = "number"
        case shortTitle = "short_title"
        case summary = "summary"
        case primarySubject = "primary_subject"
        case lastVote = "last_vote"
        case sponsorName = "sponsor_name"
    }
}

struct AllBills: Codable {
    var results: [Bills]
}

struct Bills: Codable {
    var bills: [Bill]
}
