//
//  EpisodeListView.swift
//  BreakingBadApp
//
//  Created by Leandro de Araujo Estrada on 08/11/20.
//

import SwiftUI

struct EpisodeListView: View {
    private let minimumScaleFactor: CGFloat = 0.7
    let episode: Episode
    
    init(episode: Episode) {
        self.episode = episode
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Episode:")
                .bold()
            Text("'\(episode.title)'")
                .bold()
                .foregroundColor(.black)
                .font(.title2)
                .minimumScaleFactor(minimumScaleFactor)
            
            Spacer()
            
            HStack{
                Text("Release date:")
                Text(episode.date)
                    .font(.subheadline)
                    .italic()
                    .foregroundColor(Color(.black))
                    .minimumScaleFactor(minimumScaleFactor)
                
                Text("  Season:")
                Text(episode.season)
                    .font(.subheadline)
                    .underline()
                    .foregroundColor(Color(.black))
                    .minimumScaleFactor(minimumScaleFactor)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
        .padding(10)
        .background(Color.yellow)
    }
}

struct EpisodeInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeListView(episode: Episode(
                            id: 1,
                            title: "I am not in danger, Skyler. I am the danger!",
                            season: "1",
                            episode: "1",
                            date: "1/1/2000",
                            characters: ["Characters"],
                            series: "2222")).previewLayout(.fixed(width: 375, height: 100))
    }
}
