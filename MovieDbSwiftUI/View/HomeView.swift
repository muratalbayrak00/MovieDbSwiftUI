//
//  HomeView.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 1.08.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText = ""
    @State private var searchButtonPressed = false
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Now Playing")
                    .font(.headline)
                    .padding(.horizontal)
                
                NowPlayingView()
                  
                
                Text("Popular Movie")
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.top, 40)
                
                PopularMovieView()
                    
            }
            .navigationTitle("Movies")
        }
    }
}

#Preview {
    HomeView()
}
