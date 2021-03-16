//
//  SpecificBillURLController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 3/16/21.
//

import Foundation

class SpecificBillURLController {
    static func fetchSpecificBillItems(rollCall: Int, completion: @escaping (SpecificBill?) -> Void) {
        guard let baseURL = URL(string: "https://api.propublica.org/congress/v1/115/senate/sessions/1/votes/17.json") else { fatalError() }
        
        let key = "VBuip8RlZmugied6nsDVbd8j1b4fxJ2Y3kiFrgNd"
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        request.addValue(key, forHTTPHeaderField: "X-API-Key")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            do {
                if let data = data {
                    let billInfo = try jsonDecoder.decode(SpecificBills.self, from: data)
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
