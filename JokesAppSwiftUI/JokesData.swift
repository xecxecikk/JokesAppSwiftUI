//
//  JokesData.swift
//  JokesAppSwiftUI
//
//  Created by XECE on 17.05.2025.
//

import Foundation

struct Joke: Codable, Identifiable, Equatable {
    let id: Int
    let type: String
    let joke: String?
    let setup: String?
    let delivery: String?

    var originalText: String {
        if type == "single" {
            return joke ?? ""
        } else {
            return "\(setup ?? "")\n\(delivery ?? "")"
        }
    }
}
