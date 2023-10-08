//
//  RMGetAllEpisodesResponse.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/7/23.
//

import Foundation

struct RMGetAllEpisodesReponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMEpisode]
}
