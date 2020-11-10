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
                .foregroundColor(.yellow)
                .bold()
            Text(episode.title)
                .bold()
                .foregroundColor(.white)
                .font(.title2)
                .minimumScaleFactor(minimumScaleFactor)
            
            Spacer()
            
            HStack {
                Text("Release date:")
                    .foregroundColor(.green)
                Text(episode.date)
                    .font(.subheadline)
                    .foregroundColor(Color(.white))
                    .minimumScaleFactor(minimumScaleFactor)
                
                Text("  Season:")
                    .foregroundColor(.green)
                Text(episode.season)
                    .font(.subheadline)
                    .foregroundColor(Color(.white))
                    .minimumScaleFactor(minimumScaleFactor)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
        .padding(10)
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
                            series: "2222"))
            .previewLayout(.fixed(width: 375, height: 100))
            .background(Color.black)
    }
}
