//
//  EpisodeView.swift
//  BreakingBadApp
//
//  Created by Leandro de Araujo Estrada on 06/11/20.
//

import SwiftUI

struct EpisodeView: View {
    @ObservedObject var viewModel: EpisodesListViewModel
    
    init() {
        viewModel = EpisodesListViewModel()
        configNavigationBarAppearance()
        UITableView.appearance().backgroundColor = .black
    }
    
    var body: some View {
        NavigationView {
            if let episodes = viewModel.episodes {
                List {
                    ForEach(episodes) { episode in
                        EpisodeListView(episode: episode)
                    }
                    .listRowBackground(Color.black)
                }
                .navigationBarTitle("Episodes", displayMode: .inline)
            }
            else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            }
        }
        .onAppear() {
            viewModel.fetchData()
        }
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView()
    }
}
