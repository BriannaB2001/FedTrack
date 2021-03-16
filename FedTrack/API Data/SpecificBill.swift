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

struct SpecificVote: Codable {
    var sponsor: String
    var positions: Positions
    
    enum CodingKeys: String, CodingKey {
        case sponsor = "sponsor"
        case positions = "positions"
    }
}

struct Positions: Codable {
    var votePosition: String
    
    enum Codingkeys: String, CodingKey {
    case votingPosition = "voting_position"
    }
}
