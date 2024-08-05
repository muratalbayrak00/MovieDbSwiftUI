//
//  MovieTitleView.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 2.08.2024.
//

import SwiftUI

struct MovieTitleView: View {
    
    let movie: Movie
    
    @State var rating = 0
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(movie.title ?? "nnnn")
                .multilineTextAlignment(.leading)
                .font(.title2.bold())
                .foregroundColor(.white)
            
            Text(movie.releaseDate ?? "nnnnnn")
                .font(.subheadline)
                .foregroundColor(.white)
            
            RatingView(rating: movie.voteAverage ?? 0, maxRating: 10)
                .scaledToFill()
        }
        .frame(width: .infinity, alignment: .leading)
        .padding()
        
        
    }
}

#Preview {
    MovieTitleView(movie: Movie.example.first!)
}
