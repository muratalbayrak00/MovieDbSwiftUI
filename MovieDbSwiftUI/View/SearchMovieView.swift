//
//  SearchMovieView.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 5.08.2024.
//

import SwiftUI

struct SearchMovieView: View {
    
    var movie: Movie
    
    var body: some View {
        
        HStack() {
            ImageView(movie: movie, size: 100)
                .padding(.leading, 10)
            
            VStack(alignment: .leading) {
                Text(movie.title ?? "")
                    .font(.headline)
    
                Text(movie.releaseDate ?? "")
                
            }
            
            Spacer()
            Image(systemName: "chevron.right")
                .padding(.trailing, 10)
                
        }
        
//        .overlay {
//            RoundedRectangle(cornerRadius: 6)
//                .stroke(.gray, lineWidth: 1)
//        }
        
        
    }
}

#Preview {
    SearchMovieView(movie: Movie.example.first!)
}
