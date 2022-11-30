//
//  StatusIndicator.swift
//  RickAndMorty
//
//  Created by Sam Richard on 3/13/22.
//

import SwiftUI

struct StatusIndicator: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
                    isSet.toggle()
                } label: {
                    Label("Toggle Watched", systemImage: "circle.fill")
                        .labelStyle(.iconOnly)
                        .foregroundColor(isSet ? .green : .red)
                        .animation(.easeIn, value: isSet)
                }
    }
}

struct StatusIndicator_Previews: PreviewProvider {
    static var previews: some View {
        StatusIndicator(isSet: .constant(true))
    }
}
