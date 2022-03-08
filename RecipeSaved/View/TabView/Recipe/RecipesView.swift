//
//  HomeView.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

struct RecipesView: View {
    @State private var search = ""
    
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2)
                    .tint(Color("primary"))
                }else{
                    RecipeList(recipes: viewModel.recipes)

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
