//
//  RecentVotesURLController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 3/16/21.
//

import Foundation

class RecentVotesURLController {
    static func fetchRecentVotesItems(completion: @escaping (Votes?) -> Void) {
        guard let baseURL = URL(string: "https://api.propublica.org/congress/v1/house/votes/recent.json") else { fatalError() }
        
        let key = "VBuip8RlZmugied6nsDVbd8j1b4fxJ2Y3kiFrgNd"
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        request.addValue(key, forHTTPHeaderField: "X-API-Key")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            do {
                if let data = data {
                    let billInfo = try jsonDecoder.decode(RecentVotes.self, from: data)
                    completion(billInfo.results)
                } else {
                    completion(nil)
                }
            } catch {
                print (error)
            }
        }.resume()
    }
}
