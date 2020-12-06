//
//  CharacterQuotesListViewModel.swift
//  BreakingBadApp
//
//  Created by Anthony Apollo on 17/11/20.
//

import SwiftUI

class CharacterQuotesListViewModel: ObservableObject {
    @Published var quotes: [Quote]?
    let character: Character
    let names: [String]
    
    init(character: Character) {
        self.character = character
        names = character.name.components(separatedBy: " ")
    }
    
    func fetchData() {
        let search = SearchAPIURLProvider(endpoint: .characterQuotes(names: names))
        
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
