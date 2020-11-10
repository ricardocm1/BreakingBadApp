//
//  CharacterListView.swift
//  BreakingBadApp
//
//  Created by Anthony Apollo on 08/11/20.
//

import FetchImage
import SwiftUI

struct CharacterListView: View {
    let character: Character
    
    @ObservedObject var image: FetchImage
    
    private let minimumScaleFactor: CGFloat = 0.7
    
    init(character: Character) {
        self.character = character
        image = FetchImage(url: URL(string: character.imageUrl)!)
    }
    
    var body: some View {
        HStack {
            image
                .view?
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
            Spacer()
                .frame(width: 10)
            
            VStack {
                Text(character.name)
                    .bold()
                    .foregroundColor(.white)
                    .font(.title2)
                    .minimumScaleFactor(minimumScaleFactor)
                
                Text("A.K.A. \(character.nickname)")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .minimumScaleFactor(minimumScaleFactor)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Text(character.status)
                        .bold()
                        .font(.subheadline)
                        .foregroundColor(Color(.yellow))
                        .minimumScaleFactor(minimumScaleFactor)
                }
            }
            
        }.frame(maxWidth: .infinity, idealHeight: 100, alignment: .leading)
        .padding(10)
        .onAppear {
            self.image.priority = .normal
            self.image.fetch()
        }
        .onDisappear {
            self.image.priority = .low
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(character: Character(
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
            .previewLayout(.fixed(width: 375, height: 110))
            .background(Color.black)
    }
}
