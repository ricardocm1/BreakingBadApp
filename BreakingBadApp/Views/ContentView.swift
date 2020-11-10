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
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        TabView {
            CharacterView().tabItem { Image(systemName: "person.3")
                Text("Characters")
            }
            EpisodeView().tabItem {
                Image(systemName: "film")
                Text("Episodes")
            }
            QuoteView().tabItem { Image(systemName: "ellipsis.bubble")
                Text("Quotes")
            }
            DeathView().tabItem { Image(systemName: "waveform.path.ecg")
                Text("Deaths")
            }
        }
        .onAppear(perform: onAppear)
        .accentColor(.yellow)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
