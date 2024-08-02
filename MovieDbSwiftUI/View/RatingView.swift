//
//  RatingView.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 2.08.2024.
//

import SwiftUI

struct RatingView: View {
    
    @State var rating: Int
    
    var body: some View {
        HStack {
            ForEach(1..<11) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 12, height: 12)
                    .foregroundColor( index <= rating ? .yellow : .gray)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
}

#Preview {
    RatingView(rating: 2)
}
