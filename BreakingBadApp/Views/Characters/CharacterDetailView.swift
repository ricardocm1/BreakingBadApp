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
        ZStack {
                Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 10) {
                image
                    .view?
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                
                Spacer().frame(height: 20)
                
                Group {
                    Text(character.nickname)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    
                    Text(character.occupation.joined(separator: "\n"))
                        .font(.title3)
                        .foregroundColor(Color(.darkGray))
                        .multilineTextAlignment(.center)
                    
                    Spacer().frame(height: 20)
                    
                    Text(character.status)
                        .font(.body)
                        .foregroundColor(Color(.yellow))
                    
                    HStack {
                        Text("Birthday:")
                            .foregroundColor(.green)
                            .font(.subheadline)
                            .bold()
                        Text(character.birthday)
                            .font(.body)
                            .foregroundColor(Color(.white))
                    }
                    
                    HStack {
                        Text("Portrayed by:")
                            .foregroundColor(.green)
                            .font(.subheadline)
                            .bold()
                        Text(character.portrayed)
                            .font(.body)
                            .foregroundColor(Color(.white))
                    }
                }
            }
        }
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
