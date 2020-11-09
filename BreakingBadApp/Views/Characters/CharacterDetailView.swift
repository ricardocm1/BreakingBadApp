//
//  CharacterDetailView.swift
//  BreakingBadApp
//
//  Created by Ricardo Carra Marsilio on 09/11/20.
//

import SwiftUI
import FetchImage

struct CharacterDetailView: View {
    private let character: Character
    @ObservedObject var image: FetchImage
    
    init(character: Character) {
        self.character = character
        image = FetchImage(url: URL(string: character.imageUrl)!)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            image
                .view?
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
            
            Group {
                Text(character.nickname)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                
                Text(character.occupation.joined(separator: "\n"))
                    .font(.title3)
                    .foregroundColor(Color(.darkGray))
                    .multilineTextAlignment(.center)
                
                Spacer().frame(height: 20)
                
                Text(character.birthday)
                    .font(.body)
                    .foregroundColor(Color(.darkGray))
                
                Text(character.status)
                    .font(.body)
                    .foregroundColor(Color(.darkGray))
                
                Text(character.category)
                    .font(.body)
                    .foregroundColor(Color(.darkGray))
                
    //            Text("seasons: \(character.appearance.)")
    //                .font(.body)
    //                .foregroundColor(Color(.darkGray))
                
                Spacer().frame(height: 20)
                
                Text(character.portrayed)
                    .font(.body)
                    .foregroundColor(Color(.darkGray))
            }
        }
        .padding(40)
        .navigationBarTitle(character.name, displayMode: .inline)
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: Character(
                                id: 1,
                                name: "Walter White",
                                birthday: "09-07-1958",
                                occupation: ["High School Chemistry Teacher","Meth King Pin"],
                                imageUrl:"https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
                                status: "Presumed dead",
                                nickname: "Heisenberg",
                                appearance: [1, 2, 3, 4, 5],
                                portrayed: "Bryan Cranston",
                                category: "Breaking Bad"))
    }
}
