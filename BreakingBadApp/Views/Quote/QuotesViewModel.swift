//
//  QuotesViewModel.swift
//  BreakingBadApp
//
//  Created by Ricardo Carra Marsilio on 08/11/20.
//

import SwiftUI

class QuotesViewModel: ObservableObject {
    @Published var quotes: [Quote] = []
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        let search = SearchAPIURLProvider(endpoint: .quotes)
        
        Requester.request(search: search) { [weak self] (result: Result<[Quote], APIError>) in
            switch result {
                case.success(let searchResult):
                    DispatchQueue.main.async {
                        self?.quotes = searchResult
                    }
                case.failure(let error):
                    print(error)
            }
        }
    }
}
