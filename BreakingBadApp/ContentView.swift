//
//  ContentView.swift
//  BreakingBadApp
//
//  Created by Ricardo Carra Marsilio on 04/11/20.
//

import SwiftUI

struct ContentView: View {
    func onAppear() {
        let search = SearchAPIURLProvider(endpoint: .characters)
        Requester.request(search: search) { (result: Result<[Character], APIError>) in
            switch result {
            case.success(let searchResult):
                print("registros: \(searchResult)")
            case .failure(let error):
                print(error)
            }
        }
    }

    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: onAppear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
