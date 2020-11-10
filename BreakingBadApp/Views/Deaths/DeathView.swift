//
//  DeathView.swift
//  BreakingBadApp
//
//  Created by Leandro de Araujo Estrada on 06/11/20.
//

import SwiftUI

struct DeathView: View {
    @ObservedObject var viewModel: DeathsViewModel
    
    init() {
        viewModel = DeathsViewModel()
        configNavigationBarAppearance()
        UITableView.appearance().backgroundColor = .black
    }
    
    var body: some View {
        NavigationView {
            if let deaths = viewModel.deaths {
                List {
                    ForEach(deaths) { death in
                            DeathInfoView(death)
                    }
                    .listRowBackground(Color.black)
                }
                .navigationBarTitle("Deaths", displayMode: .inline)
            }
            else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            }
        }
        .onAppear() {
            viewModel.fetchData()
        }
    }
}

struct DeathView_Previews: PreviewProvider {
    static var previews: some View {
        DeathView()
    }
}
