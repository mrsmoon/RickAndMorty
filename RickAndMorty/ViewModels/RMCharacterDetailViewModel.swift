//
//  RMCharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/5/23.
//

import Foundation

final class RMCharacterDetailViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
