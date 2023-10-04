//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/3/23.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
    
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
