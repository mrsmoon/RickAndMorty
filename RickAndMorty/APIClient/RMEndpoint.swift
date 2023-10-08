//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/3/23.
//

import Foundation

/// Represents a unique API endpoint
@frozen enum RMEndpoint: String, CaseIterable, Hashable {
    /// Enpoint to get character info
    case character
    /// Enpoint to get location info
    case location
    /// Enpoint to get episode info
    case episode
}
