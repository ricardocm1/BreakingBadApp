//
//  View+UINavigationBarAppearance.swift
//  BreakingBadApp
//
//  Created by Ricardo Carra Marsilio on 08/11/20.
//

import SwiftUI

extension View {
    func configNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        appearance.backgroundColor = UIColor(Color(.black))
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
