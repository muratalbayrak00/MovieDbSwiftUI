//
//  SearchView.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 1.08.2024.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel()
    @State private var searchTerm = ""

    var filteredMovies: [Movie] {
        if searchTerm.isEmpty {
            return Array(Set(viewModel.searchResult))
        } else {
            return Array(Set(viewModel.searchResult.filter { $0.title.localizedCaseInsensitiveContains(searchTerm) }))
        }
    }
    
    var body: some View {
    
        NavigationStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    ForEach(filteredMovies, id: \.id) { movie in
                        
                        NavigationLink {
                            MovieDetailView(movie: movie)
                        } label: {
                            SearchMovieView(movie: movie)
                        }
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .scaledToFill()
                    }
                    .frame(maxHeight: 150)
                }
            }
            .navigationTitle("Search Movies")
            .task {
                await viewModel.fetchMovies()
            }
            .searchable(text: $searchTerm, prompt: "Search Movies")
        }

    }
}

#Preview {
    SearchView()
}
