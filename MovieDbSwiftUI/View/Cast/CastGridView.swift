//
//  CastGridView.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 2.08.2024.
//

import SwiftUI

struct CastGridView: View {
    
    @StateObject var viewModel = CastViewModel()
    let movie: Movie
    
    let rows = [
        GridItem(.fixed(120)),
        GridItem(.fixed(120))
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            
            LazyHGrid(rows: rows, spacing: 16) {
                
                if viewModel.fetchedCast.count > 10 {
                    ForEach(viewModel.fetchedCast.prefix(upTo: 10), id: \.id) { cast in
                        
                        CastRowView(movie: movie, cast: cast)
                    }
                }
                
            }
            
        }
        .task {
            await viewModel.fetchCast(movieId: movie.id ?? 1)
        }
    }
}

#Preview {
    CastGridView(movie: Movie.example.first!)
}
