//
//  EpisodesListViewModel.swift
//  BreakingBadApp
//
//  Created by Leandro de Araujo Estrada on 08/11/20.
//

import SwiftUI

class EpisodesListViewModel: ObservableObject {
    @Published var episodes: [Episode] = []

    init() {
        fetchData()
    }

    private func fetchData() {
        let search = SearchAPIURLProvider(endpoint: .episodes)
        
        Requester.request(search: search) { [weak self] (result: Result<[Episode], APIError>) in
            switch result {
                case.success(let searchResult):
                    DispatchQueue.main.async {
                        self?.episodes = searchResult
                    }
                case.failure(let error):
                    print(error)
            }
        }
    }
}
