//
//  CharacterView.swift
//  BreakingBadApp
//
//  Created by Leandro de Araujo Estrada on 06/11/20.
//

import SwiftUI

struct CharacterView: View {
    @ObservedObject var viewModel = CharactersListViewModel()
    
    init() {
        configNavigationBarAppearance()
    }
    
    var body: some View {
        NavigationView {
            List {
                if let characters = self.viewModel.characters {
                    ForEach(characters) { character in
                            CharacterListView(character: character)
                    }
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                }
            }
            .navigationBarTitle("Characters", displayMode: .inline)
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
