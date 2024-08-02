//
//  CastViewModel.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 1.08.2024.
//

import Foundation

final class CastViewModel: ObservableObject {
    
    @Published var fetchedCast = [Cast]()
    
    func fetchCast(movieId: Int) async {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/credits?api_key=\(Constants.apikey)&language=en-US") else {
            print("InvalidURL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let decodedCast = try decoder.decode(CastResponse.self, from: data)
            DispatchQueue.main.async {
                self.fetchedCast.append(contentsOf: decodedCast.cast ?? [Cast]())
            }
        } catch {
            print("JSON DECODE ERROR")
        }
        
    }
}
