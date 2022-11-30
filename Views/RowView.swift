//
//  RowView.swift
//  RickAndMorty
//
//  Created by Sam Richard on 3/8/22.
//

import SwiftUI

let ARTWORK_HEIGHT = 30.0

struct RowView: View {
    var character: Character
    
    var body: some View {
        // Presumably this feels very familiar…
        HStack {
            AsyncImage(url: URL(string: character.image ?? "")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 70.0, maxHeight: 90.0)
            .padding(.trailing, 5.0)
            
            Text(character.name)
            Spacer()
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(character: Character(
            id: 197,
            name: "Kyle",
            species: "Human",
            type: "Miniverse Inhabitant",
            gender: "Male",
            status: "Alive",
            location: Character.Location(
                name:
                    "Kyle's Teenyverse",
                url:
                    "xxx"),
            
            image:
                "https://rickandmortyapi.com/api/character/avatar/197.jpeg"
        ))
    }
}
