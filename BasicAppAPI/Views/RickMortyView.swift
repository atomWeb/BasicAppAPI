//
//  ContentView.swift
//  BasicAppAPI
//
//  Created by Cristian Jose Perez Guerra on 1/4/25.
//

import SwiftUI

struct RickMortyView: View {
    
    // @State private var vm = RickMortyVM()
    @State var vm = RickMortyVM()
    
    
    var body: some View {
        ZStack {
            List (vm.rmCharList) { rickmorty in
                HStack {
                    Text(rickmorty.name)
                    Spacer()
                    Text(rickmorty.createdDateStr)
                }
            }
            .task {
                if vm.rmCharList.isEmpty {
                    await vm.fetchCharacters()
                }
            }
        }
    }
}

#Preview {
    RickMortyView(vm: .preview)
}
