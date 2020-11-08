//
//  DeathView.swift
//  BreakingBadApp
//
//  Created by Leandro de Araujo Estrada on 06/11/20.
//

import SwiftUI

struct DeathView: View {
    @ObservedObject var viewModel = DeathsViewModel()
    
    init() {
        configNavigationBarAppearance()
    }
    
    var body: some View {
        NavigationView {
            List {
                if let deaths = viewModel.deaths {
                    ForEach(deaths) { death in
                            DeathInfoView(death)
                    }
                }
                else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                }
            }
            .navigationBarTitle("Deaths", displayMode: .inline)
        }
    }
}

struct DeathView_Previews: PreviewProvider {
    static var previews: some View {
        DeathView()
    }
}
