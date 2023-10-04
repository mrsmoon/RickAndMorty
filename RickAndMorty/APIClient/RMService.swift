//
//  RMService.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/3/23.
//

import Foundation


/// Primary API service object to get Rick and Morty data
final class RMService {
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    
    /// Send Rick and Morty API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data an error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void ) {
        
    }
}
