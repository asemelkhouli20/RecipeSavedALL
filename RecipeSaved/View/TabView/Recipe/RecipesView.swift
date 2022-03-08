//
//  HomeView.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

struct RecipesView: View {
    @State private var search = ""
    @State private var isLoading = false
    var body: some View {
        NavigationView{
            ZStack{
                if isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2)
                    .tint(Color("primary"))
                }else{
                    RecipeList(recipes: RecipeModel.all)

                }
                
            }
            
            .toolbar(content: {
                ToolbarItem {
                    Button {
                        
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                    
                }
            })
            
            .searchable(text: $search)
            .navigationTitle("Recipes")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        .navigationViewStyle(.stack)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
