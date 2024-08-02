//
//  MovieViewModel.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 1.08.2024.
//

import Foundation

final class MovieViewModel: ObservableObject {
    
    @Published var fetchedMovies = [Movie]()
    @Published var page = 1
    
    let popularMovieUrl = "https://api.themoviedb.org/3/movie/popular?api_key=\(Constants.apikey)&language=en-US&page="

    func fetchMovies() async {
        guard let url = URL(string: "\(popularMovieUrl)\(page)") else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let decodedMovie = try decoder.decode(MovieResponse.self, from: data)
            DispatchQueue.main.async {
                self.fetchedMovies.append(contentsOf: decodedMovie.results ?? [Movie]())
            }
            
        } catch {
            print("JSON DECODE ERROR")
        }
    }
}

