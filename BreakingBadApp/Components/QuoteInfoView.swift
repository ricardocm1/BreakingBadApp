//
//  QuoteView.swift
//  BreakingBadApp
//
//  Created by Ricardo Carra Marsilio on 08/11/20.
//

import SwiftUI

struct QuoteInfoView: View {
    private let minimumScaleFactor: CGFloat = 0.7
    let quote: Quote
    
    init(_ quote: Quote) {
        self.quote = quote
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Quote:")
                .foregroundColor(.yellow)
                .bold()
            Text("'\(quote.quote)'")
                .bold()
                .foregroundColor(.white)
                .font(.title3)
                .minimumScaleFactor(minimumScaleFactor)
            
            Spacer()
            
            HStack {
                Text("Author:")
                    .foregroundColor(.green)
                Text(quote.author)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .minimumScaleFactor(minimumScaleFactor)
                
                Text("Serie:")
                    .foregroundColor(.green)
                Text(quote.series)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .minimumScaleFactor(minimumScaleFactor)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
        .padding(10)
    }
}

struct QuoteInfoView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteInfoView(Quote(id: 1, quote: "I am not in danger, Skyler. I am the danger!", author: "Walter White", series: "Breaking Bad"))
            .previewLayout(.fixed(width: 375, height: 100))
            .background(Color.black)
    }
}
