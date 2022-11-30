//
//  ListView.swift
//  RickAndMorty
//
//  Created by Sam Richard on 3/8/22.
//

import SwiftUI

struct ListView: View {
    var searchStatus: String
    var searchSpecies: String
    var searchGender: String
    
    @State var loading = false
    @State var errorOccurred = false
    @State var results: [Character] = []
    
    var body: some View {
        NavigationView {
            VStack {
                if loading {
                    ProgressView()
                } else if errorOccurred {
                    // Very bare bones of course; robust apps will do this better.
                    Text("Sorry, something went wrong.")
                } else {
                    //List(results, id: \.id) { item in
                    List {
                        ForEach(results, id: \.id) { item in
                            NavigationLink {
                                DetailView(character: item)
                            } label: {
                                RowView(character: item)
                                    .navigationBarHidden(true)  
                            }
                            
                        }
                        
                        
                    }.refreshable {
                        await loadSearchResults()
                    }
                    
                }
            }
            
            .task(id: searchGender) {
                await loadSearchResults()
            }
            
        }
    }
    
    func loadSearchResults() async {
        errorOccurred = false
        loading = true
        
        do {
            let searchPage = try await searchCharacters(status: searchStatus, species: searchSpecies, gender: searchGender)
            results = searchPage.results
        } catch {
            errorOccurred = true
            
            // Only a dev will be able to see this, of course.
            debugPrint("Unexpected error: \(error)")
        }
        
        loading = false
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(searchStatus: "", searchSpecies: "", searchGender: "male")
    }
}
