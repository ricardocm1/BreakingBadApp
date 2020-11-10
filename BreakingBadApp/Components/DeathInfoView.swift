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
            Text("Death:")
                .foregroundColor(.yellow)
                .bold()
            Text(death.death)
                .bold()
                .foregroundColor(.white)
                .font(.title2)
                .minimumScaleFactor(minimumScaleFactor)
            
            Text("Cause:")
                .foregroundColor(.yellow)
                .bold()
            Text(death.cause)
                .bold()
                .foregroundColor(.white)
                .lineLimit(2)
                .font(.body)
                .minimumScaleFactor(minimumScaleFactor)
            
            Spacer()
            
            HStack {
                Text("Last words:")
                    .foregroundColor(.green)
                    .font(.subheadline)
                    .bold()
                Text("'\(death.lastWords)'")
                    .foregroundColor(Color(.white))
                    .font(.subheadline)
                    .minimumScaleFactor(minimumScaleFactor)
            }
            
            HStack {
                Text("Responsible:")
                    .foregroundColor(.green)
                    .font(.subheadline)
                    .bold()
                Text(death.responsible)
                    .lineLimit(2)
                    .foregroundColor(Color(.white))
                    .font(.subheadline)
                    .minimumScaleFactor(minimumScaleFactor)
            }
            
            HStack {
                Text("Season:")
                    .foregroundColor(.green)
                    .font(.subheadline)
                    .bold()
                Text(death.season.description)
                    .foregroundColor(Color(.white))
                    .minimumScaleFactor(minimumScaleFactor)
                
                Text("Episode:")
                    .foregroundColor(.green)
                    .font(.subheadline)
                    .bold()
                Text(death.episode.description)
                    .foregroundColor(Color(.white))
                    .minimumScaleFactor(minimumScaleFactor)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, idealHeight: 150, alignment: .leading)
        .padding(10)
    }
}

struct DeathInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DeathInfoView(Death(id: 1, death: "Marco Salamanca", cause: "Shot in the head.", responsible: "Hank Schrader (Henry Schrader, Gustavo Fring associated)", lastWords: "Too easy", season: 3, episode: 7, numberOfDeaths: 1))
            .previewLayout(.fixed(width: 375, height: 150))
            .background(Color.black)
    }
}
