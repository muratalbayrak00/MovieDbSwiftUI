//
//  SearchViewModel.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 1.08.2024.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    @Published var searchResult = [Movie]()
    @Published var page = 1
        
    let movieUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(Constants.apikey)&language=en-US&page="

    func fetchMovies() async {// searchText: String boyle bir parametre ekle
        guard let url = URL(string: "\(movieUrl)\(page)") else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let decodedMovie = try decoder.decode(MovieResponse.self, from: data)
            DispatchQueue.main.async {
                self.searchResult.append(contentsOf: decodedMovie.results ?? [Movie]())
            }
            
        } catch {
            print("JSON DECODE ERROR")
        }
    }
    
}
