//
//  QuoteView.swift
//  BreakingBadApp
//
//  Created by Leandro de Araujo Estrada on 06/11/20.
//

import SwiftUI

struct QuoteView: View {
    @ObservedObject var viewModel = QuotesViewModel()
    
    init() {
        configNavigationBarAppearance()
    }
    
    var body: some View {
        NavigationView {
            List {
                if let quotes = viewModel.quotes {
                    ForEach(quotes) { quote in
                            QuoteInfoView(quote)
                    }
                }
                else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                }
            }
            .navigationBarTitle("Quotes", displayMode: .inline)
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
