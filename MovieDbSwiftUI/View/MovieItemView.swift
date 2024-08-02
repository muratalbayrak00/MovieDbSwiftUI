//
//  MovieItemView.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 2.08.2024.
//

import SwiftUI

struct MovieItemView: View {
    
    let movie: Movie
    
    var body: some View {
      ImageView(movie: movie, size: 150)
            .padding(.horizontal,8)
    }
}

#Preview {
    MovieItemView(movie: Movie.example.first!)
        .previewLayout(.sizeThatFits)
}
