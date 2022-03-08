//
//  ContentView.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            RecipesView()
                .tabItem {
                    Label("Rcipe", systemImage: "network")
                }
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
           
        }
            
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
