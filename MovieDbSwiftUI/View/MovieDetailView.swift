//
//  MovieDetailView.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 2.08.2024.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
             
            DetailHeaderView(movie: movie)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Overview")
                    .font(.headline)
                
                Text(movie.overview ?? "")
                    .font(.system(size: 16))
                    .multilineTextAlignment(.leading)
                
                Text("Top Cast")
                    .font(.headline)
                            }
            .frame(width: .infinity, alignment: .leading)
            .padding()
            
            VStack {
                CastGridView(movie: movie)
                    .padding(.horizontal)
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    MovieDetailView(movie: Movie.example.first!)
        .previewLayout(.sizeThatFits)
}
