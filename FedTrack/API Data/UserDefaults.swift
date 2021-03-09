//
//  UserDefaults.swift
//  FedTrack
//
//  Created by Brianna Babcock on 3/9/21.
//

import Foundation

import Foundation

let defaults = UserDefaults.standard

class Defaults {
    
    static var bill: [Bill]? {
        get {
            guard let data = UserDefaults.standard.data(forKey: #function) else { return nil }
            return try? JSONDecoder().decode([Bill].self, from: data)
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: #function)
        }
    }
}
