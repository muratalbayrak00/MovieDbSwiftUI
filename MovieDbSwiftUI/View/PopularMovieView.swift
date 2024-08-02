//
//  PopularMovieView.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 1.08.2024.
//

import SwiftUI

struct PopularMovieView: View {
    
    @StateObject var viewModel = MovieViewModel()

    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.fetchedMovies, id: \.id) { movie in
                   
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieItemView(movie: movie)
                    }
                }
            }
            .frame(maxHeight: 250)
        }
        .task {
            await viewModel.fetchMovies()
        }
    
    }
}

#Preview {
    PopularMovieView()
}
