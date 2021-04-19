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
    var yes: Int
    var no: Int
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
    var votePosition: String
    var state: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case votePosition = "vote_position"
        case state = "state"
    }
}
