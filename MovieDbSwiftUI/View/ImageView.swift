//
//  ImageView.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 2.08.2024.
//

import SwiftUI

struct ImageView: View {
    
    let movie: Movie
    let size: CGFloat
    
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "\(Constants.imageBaseUrl)\(movie.posterPath ?? "")")) { img in
                
                img
                    .resizable()
                    .scaledToFit()
                    .frame(width: size)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(maxHeight: 250)
                
            }
        placeholder: {
            ProgressView()
        }
            
        }
    }
}

#Preview {
    ImageView(movie: Movie.example.first!, size: 150)
        .previewLayout(.sizeThatFits)
}
