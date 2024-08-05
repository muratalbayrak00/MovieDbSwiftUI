//
//  RatingView.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 2.08.2024.
//

import SwiftUI

struct RatingView: View {
    
    struct ClipShape: Shape {
        let width: Double
        
        func path(in rect: CGRect) -> Path {
            Path(CGRect(x: rect.minX, y: rect.minY, width: width , height: rect.height))
        }
    }
    
    let rating: Double
    let maxRating: Int
    
    init(rating: Double, maxRating: Int) {
        self.maxRating = maxRating
        self.rating = rating
    }

    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Text(Image(systemName: "star"))
                    .foregroundColor(.yellow)
                    .aspectRatio(contentMode: .fill)
            }
        }.overlay(
            GeometryReader { reader in
                HStack(spacing: 0) {
                    ForEach(0..<maxRating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .aspectRatio(contentMode: .fit)
                        
                    }
                }
                .clipShape(
                    ClipShape(width: (reader.size.width / CGFloat(maxRating) * CGFloat(rating)))
                )
            }
        )

    }
}

#Preview {
    RatingView(rating: 7.8, maxRating: 10)
}
