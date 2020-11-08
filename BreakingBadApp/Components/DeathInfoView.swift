//
//  DeathInfoView.swift
//  BreakingBadApp
//
//  Created by Ricardo Carra Marsilio on 08/11/20.
//

import SwiftUI

struct DeathInfoView: View {
    private let minimumScaleFactor: CGFloat = 0.7
    let death: Death
    
    init(_ death: Death) {
        self.death = death
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(death.death)
                .bold()
                .foregroundColor(.black)
                .font(.title2)
                .minimumScaleFactor(minimumScaleFactor)
            
            Spacer()
            
            Text("Cause: \(death.cause)")
                .lineLimit(2)
                .foregroundColor(Color(.darkGray))
                .minimumScaleFactor(minimumScaleFactor)
            
            Text("Last words: '\(death.lastWords)'")
                .foregroundColor(Color(.darkGray))
                .minimumScaleFactor(minimumScaleFactor)
            
            Text("Responsible: \(death.responsible)")
                .lineLimit(2)
                .foregroundColor(Color(.darkGray))
                .minimumScaleFactor(minimumScaleFactor)
            
            Spacer()
            
            HStack {
                Text("Season: \(death.season)")
                    .foregroundColor(Color(.darkGray))
                    .minimumScaleFactor(minimumScaleFactor)
                
                Text("Episode: \(death.episode)")
                    .foregroundColor(Color(.darkGray))
                    .minimumScaleFactor(minimumScaleFactor)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, idealHeight: 100, maxHeight: .infinity, alignment: .leading)
        .padding(10)
    }
}

struct DeathInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DeathInfoView(Death(id: 1, death: "Marco Salamanca", cause: "Shot in the head.", responsible: "Hank Schrader (Henry Schrader, Gustavo Fring associated)", lastWords: "Too easy", season: 3, episode: 7, numberOfDeaths: 1)).previewLayout(.fixed(width: 375, height: 100))
    }
}
