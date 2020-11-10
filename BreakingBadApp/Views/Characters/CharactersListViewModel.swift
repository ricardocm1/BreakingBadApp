//
//  CharactersListViewModel.swift
//  BreakingBadApp
//
//  Created by Anthony Apollo on 08/11/20.
//

import SwiftUI

class CharactersListViewModel: ObservableObject {
    @Published var characters: [Character]?

    func fetchData() {
        let search = SearchAPIURLProvider(endpoint: .characters)
        
        Requester.request(search: search) { [weak self] (result: Result<[Character], APIError>) in
            switch result {
                case.success(let searchResult):
                    DispatchQueue.main.async {
                        self?.characters = searchResult
                    }
                case.failure(let error):
                    print(error)
            }
        }
    }
}
