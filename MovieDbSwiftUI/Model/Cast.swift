//
//  Cast.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 1.08.2024.
//

import Foundation

struct CastResponse: Decodable {
    let cast: [Cast]?
}

struct Cast: Decodable {
    let id: Int?
    let name: String?
    let profilePath: String?
    let character: String?
    let order: Int?
}

extension Cast {
    
    static let example = Cast(
        id: 1,
        name: "Eren Gülbahar",
        profilePath: "/coC58ANiDbqRIyle5zEl9QDektf.jpg",
        character: "Top toplayıcı",
        order: 1
    )
}
