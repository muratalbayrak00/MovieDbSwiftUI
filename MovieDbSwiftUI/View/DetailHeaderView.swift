//
//  DetailHeaderView.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 2.08.2024.
//

import SwiftUI

struct DetailHeaderView: View {
    
    let movie: Movie
    
    let gradient = LinearGradient(
        gradient: Gradient(stops: [
        .init(color: .gray, location: 0),
        .init(color: .clear, location: 0.5)
    ]),
        startPoint: .bottom,
        endPoint: .top
    )
    
    var body: some View {
        
        AsyncImage(url: URL(string: "\(Constants.imageBaseUrl)\(movie.posterPath ?? "")")) { img in
            
            img
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                .clipped()
                .overlay {
                    ZStack(alignment: .bottom) {
                        
                        gradient
                        HStack {
                            ImageView(movie: movie, size: 120)
                            MovieTitleView(movie: movie)
                        }
                        
                    }
                }
            
        } placeholder: {
            ProgressView()
        }
        
    }
}

#Preview {
    DetailHeaderView(movie: Movie.example.first!)
}
