//
//  MainView.swift
//  MovieDbSwiftUI
//
//  Created by murat albayrak on 1.08.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
        }
    }
}

#Preview {
    MainView()
}
