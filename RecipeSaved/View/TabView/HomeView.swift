//
//  FavouritesView.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var addPressed = false
    var body: some View {
        NavigationView{
            Text(" favourites")
                
                .toolbar {
                    ToolbarItem{
                        Button {
                            addPressed = true
                        } label: {
                            Label("Add", systemImage: "plus")
                        }
                        .sheet(isPresented: $addPressed) {
                            AddRecipe()
                        }
                    }
                    
                }
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
        }
        
        .navigationViewStyle(.stack)
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
