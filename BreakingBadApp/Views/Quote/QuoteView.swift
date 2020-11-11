//
//  QuoteView.swift
//  BreakingBadApp
//
//  Created by Leandro de Araujo Estrada on 06/11/20.
//

import SwiftUI

struct QuoteView: View {
    @ObservedObject var viewModel: QuotesViewModel
    
    init() {
        viewModel = QuotesViewModel()
        configNavigationBarAppearance()
        UITableView.appearance().backgroundColor = .black
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                if let quotes = viewModel.quotes {
                    List {
                        ForEach(quotes) { quote in
                                QuoteInfoView(quote)
                        }
                        .listRowBackground(Color.black)
                    }
                    .navigationBarTitle("Quotes", displayMode: .inline)
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

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
