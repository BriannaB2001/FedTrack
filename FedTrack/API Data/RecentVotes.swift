//
//  RecentVotes.swift
//  FedTrack
//
//  Created by Brianna Babcock on 3/16/21.
//

import Foundation

struct Vote: Codable {
    var rollCall: Int
    
    enum CodingKeys: String, CodingKey {
        case rollCall = "roll_call"
    }
}

struct RecentVotes: Codable {
    var results: [Votes]
}

struct Votes: Codable {
    var votes: [Vote]
}
