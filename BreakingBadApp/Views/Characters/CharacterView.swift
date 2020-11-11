//
//  CharacterView.swift
//  BreakingBadApp
//
//  Created by Leandro de Araujo Estrada on 06/11/20.
//

import SwiftUI

struct CharacterView: View {
    @ObservedObject var viewModel: CharactersListViewModel
    
    init() {
        viewModel = CharactersListViewModel()
        configNavigationBarAppearance()
        UITableView.appearance().backgroundColor = .black
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                if let characters = self.viewModel.characters {
                    List {
                        ForEach(characters) { character in
                            NavigationLink(destination: CharacterDetailView(character: character)) {
                                CharacterListView(character: character)
                            }
                        }
                        .listRowBackground(Color.black)
                    }
                    .navigationBarTitle("Characters", displayMode: .inline)
                }
                else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
            }
        }
        .onAppear() {
            viewModel.fetchData()
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
