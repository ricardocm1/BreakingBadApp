//
//  DeathsViewModel.swift
//  BreakingBadApp
//
//  Created by Ricardo Carra Marsilio on 08/11/20.
//

import Foundation

class DeathsViewModel: ObservableObject {
    @Published var deaths: [Death] = []
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        let search = SearchAPIURLProvider(endpoint: .deaths)
        
        Requester.request(search: search) { [weak self] (result: Result<[Death], APIError>) in
            switch result {
                case.success(let searchResult):
                    DispatchQueue.main.async {
                        self?.deaths = searchResult
                    }
                case.failure(let error):
                    print(error)
            }
        }
    }
}
