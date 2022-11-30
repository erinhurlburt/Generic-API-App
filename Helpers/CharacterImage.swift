//
//  CharacterImage.swift
//  RickAndMorty
//
//  Created by Sam Richard on 3/8/22.
//

import SwiftUI

struct CharacterImage: View {
    let imageDimension: CGFloat = 96.0 // Dictated by the API.
    var imageUrl: String

    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
        } placeholder: {
            ProgressView()
        }.frame(
            width: imageDimension, height: imageDimension, alignment: .center
        )
    }
}

struct PokeAPIImage_Previews: PreviewProvider {
    static var previews: some View {
        CharacterImage(imageUrl: "https://rickandmortyapi.com/api/character/avatar/197.jpeg")
    }
}


