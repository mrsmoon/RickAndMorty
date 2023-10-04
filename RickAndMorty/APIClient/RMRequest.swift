//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/3/23.
//

import Foundation

/// Object that represents a single API call
final class RMRequest {
    /// API constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api/"
    }
    
    private let endpoint: RMEndpoint
    private let pathComponent: Set<String>
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the API request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += endpoint.rawValue
        
        if !pathComponent.isEmpty {
            pathComponent.forEach {
                string += "/\($0)"
            }
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    /// Constructor request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponent: Collection of path components
    ///   - queryParameters: Collection of query parameters
    public init(
        endpoint: RMEndpoint,
        pathComponent: Set<String> = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponent = pathComponent
        self.queryParameters = queryParameters
    }
}
