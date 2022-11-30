//
//  APIView.swift
//  RickAndMorty
//
//  Created by Sam Richard on 3/8/22.
//

import SwiftUI

struct characterGender {
    let label: String
    let type: String
}

struct APIView: View {
    let SEARCHABLE_GENDERS = [
        characterGender(label: "Male", type: "male"),
        characterGender(label: "Female", type: "female")
    ]
    
    @State var status: String = ""
    @State  var species = ""
    
    //let status = "dead"
    //let species = "human"
    
    @State var gender = "male"
    

    var body: some View {
    
        
        VStack {
            HStack {
                TextField("Enter Status ", text: $status)
                //Text("Status: \(status)")
                //Text("Searching for:")
                //Text(status)
                    //.bold()
                    //.italic()
                TextField("Enter Species ", text: $species)
                //Text("Species: \(species)")
                //Text(species)
                    //.bold()
                    //.italic()
            }
            .padding(.horizontal)
            
            Picker("", selection: $gender) {
                ForEach(SEARCHABLE_GENDERS, id: \.type) {
                    searchableGender in Text(searchableGender.label)
                }
            }
            .pickerStyle(.segmented)
            .background(Color.green)
            .padding(.horizontal)
            
            ListView(searchStatus: status, searchSpecies: species, searchGender: gender)
              
        }
    }
}


struct APIView_Previews: PreviewProvider {
    static var previews: some View {
        APIView()
    }
}
