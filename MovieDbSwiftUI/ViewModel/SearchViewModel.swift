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
        
    func fetchMovies(searchText: String) async {
        guard let url = URL(string: "...\(page)") else {
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
