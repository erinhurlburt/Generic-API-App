//
//  Character.swift
//  RickAndMorty
//
//  Created by Sam Richard on 3/8/22.
//

import Foundation

struct Character: Hashable, Codable {
    var id: Int
    var name: String
    var species: String
    var type: String
    var gender: String
    var status: String
    var location: Location
    var isAlive: Bool {
        switch(status) {
            case "Alive":
                return true
            default:
                return false
        }
    }
    
    var image: String?
    
    struct Location: Hashable, Codable {
        // These images aren’t always available so are defined as optional.
        var name: String?
        var url: String?
    }
}


struct CharacterSearchPage: Hashable, Codable {
    var results: [Character]
}
