//
//  RickMortyAPI.swift
//  RickAndMorty
//
//  Created by Sam Richard on 3/8/22.
//

import Foundation

let RICK_ROOT = "https://rickandmortyapi.com/api/"
let SEARCH_ENDPOINT = "\(RICK_ROOT)/character"

enum RickAPIError: Error {
    case unsuccessfulDecode
}

func searchCharacters(status: String, species: String, gender: String) async throws -> CharacterSearchPage {
    // There are more structured ways to construct a URL with query parameters but
    // this suffices for this fixed pair.
    guard let url = URL(string: "\(SEARCH_ENDPOINT)?status=\(status)&species=\(species)&gender=\(gender)") else {
        fatalError("Should never happen, but just in case…URL didn’t work 😔")
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    if let decodedPage = try? JSONDecoder().decode(CharacterSearchPage.self, from: data) {
        return decodedPage
    } else {
        throw RickAPIError.unsuccessfulDecode
    }
}
