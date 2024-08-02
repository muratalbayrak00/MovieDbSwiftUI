//
//  CastRowView.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 2.08.2024.
//

import SwiftUI

struct CastRowView: View {
    
    let movie: Movie
    let cast: Cast
    
    var body: some View {
        AsyncImage(url: URL(string: "\(Constants.imageBaseUrl)\(cast.profilePath ?? "")")) { image in
            
            image
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay {
                    Circle()
                        .stroke(lineWidth: 1)
                        .foregroundColor(.red)
                }
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    CastRowView(movie: Movie.example.first!, cast: Cast.example)
}
