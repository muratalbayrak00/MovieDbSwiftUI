//
//  Movie.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 1.08.2024.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [Movie]?
}

struct Movie: Decodable, Hashable {
    let id: Int?
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let title: String
    let voteCount: Int?
    let voteAverage: Double?
}

extension Movie {
    static let example: [Movie] = [
    
        Movie(id: 1096197, overview: "Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own.", posterPath: "/gmGK5Gw5CIGMPhOmTO0bNA9Q66c.jpg", releaseDate: "23 Nisan", title: "Movie title", voteCount: 123, voteAverage: 6.8),
        
        Movie(id: 2, overview: "Overview2", posterPath: "/hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg", releaseDate: "23 Nisan", title: "Movie title 2", voteCount: 343, voteAverage: 5.8)
    
    
    ]
}
