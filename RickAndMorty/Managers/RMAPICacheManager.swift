//
//  RMAPICacheManager.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/7/23.
//

import Foundation

/// Manage in-memory sesion scoped by API caches.
final class RMAPICacheManager {
    private var cacheDictionary: [RMEndpoint: NSCache<NSString, NSData>] = [:]
    private var cache = NSCache<NSString, NSData>()
    
    init() {
        setupCache()
    }
    
    //MARK: - Public
    
    public func cachedResponse(for endpoint: RMEndpoint, url: URL?) -> Data? {
        guard let targetCache = cacheDictionary[endpoint], let url = url else {
            return nil
        }
        
        let key = url.absoluteString as NSString
        return targetCache.object(forKey: key) as? Data
    }
    
    public func setCache(for endpoint: RMEndpoint, url: URL?, data: Data) {
        guard let targetCache = cacheDictionary[endpoint], let url = url else {
            return
        }
        
        let key = url.absoluteString as NSString
        return targetCache.setObject(data as NSData, forKey: key)
    }
    
    //MARK: - Private
    
    private func setupCache() {
        RMEndpoint.allCases.forEach({ endpoint in
            cacheDictionary[endpoint] = NSCache<NSString, NSData>()
        })
    }
}
