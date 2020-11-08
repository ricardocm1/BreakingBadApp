//
//  EpisodeView.swift
//  BreakingBadApp
//
//  Created by Leandro de Araujo Estrada on 06/11/20.
//

import SwiftUI

struct EpisodeView: View {
    @ObservedObject var viewModel = EpisodesListViewModel()
    
    init() {
        configNavigationBarAppearance()
    }
    
    var body: some View {
        NavigationView {
            List {
                
                if let episodes = viewModel.episodes {
                    ForEach(episodes) { episode in
                        EpisodeListView(episode: episode)
                    }
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                }
            }
            .navigationBarTitle("Episodes", displayMode: .inline)
        }
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView()
    }
}
