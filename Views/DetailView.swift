//s3
//  DetailView.swift
//  RickAndMorty
//
//  Created by Sam Richard on 3/8/22.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .scale.combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
                )
    }
}

struct DetailView: View {
    var character: Character
    
    @State private var showDetail = false

    var body: some View {
        ScrollView {
            CharacterImage(imageUrl: character.image ?? "")
                .overlay {
                    Rectangle().stroke(.black, lineWidth: 4).frame(width: 300, height: 300)
                }
                .aspectRatio(contentMode: .fill)
                .frame(height: 180)
                .offset(y: 50)
                .padding(.bottom, 110)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(character.name)
                    .font(.title)
                    .bold()
                }
                
                
                VStack {
                    HStack{
                        Text(character.species)
                        
                        Label("Graph", systemImage: "minus")
                            .labelStyle(.iconOnly)

                        Text(character.status)
                        
                        StatusIndicator(isSet: .constant(character.isAlive))
                    }
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                HStack(alignment: .center) {
                    Text("More Information:")
                        .font(.headline)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            showDetail.toggle()
                        }
                    } label: {
                        Label("Graph", systemImage: "chevron.right.circle")
                            .labelStyle(.iconOnly)
                            .imageScale(.large)
                            .rotationEffect(.degrees(showDetail ? 90 : 0))
                            .scaleEffect(showDetail ? 1.5 : 1)
                            .padding()
                        
                    }
                }
                
                
                
            }
            .padding()
            
            if showDetail {
                VStack(alignment: .center) {
                    
                    Text("Type:")
                        .font(.headline)
                    
                    Text(character.type)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text("Last Known Location:")
                        .font(.headline)
                    
                    Text(character.location.name ?? "")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        
                    
                    
                }
                .background(BadgeBackground())
                .padding()
                .transition(.moveAndFade)
            }
            
        }
        
        //.navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(character: Character(
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
