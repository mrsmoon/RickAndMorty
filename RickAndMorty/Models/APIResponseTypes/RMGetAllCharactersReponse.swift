//
//  RMGetAllCharactersReponse.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/4/23.
//

import Foundation

struct RMGetAllCharactersReponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}
