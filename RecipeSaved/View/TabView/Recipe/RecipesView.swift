//
//  HomeView.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

struct RecipesView: View {
    @State private var search = ""
    @State private var showFilter=false
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
            .halfSheet(showSheet: $showFilter, sheetView: {
                FilterView()
            }, onEnd: {})
            
            .toolbar(content: {
                ToolbarItem {
                    Button {
                        viewModel.isLoading=true
                        viewModel.recipes=[]
                        viewModel.fetch(ser: nil)
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showFilter=true
                    } label: {
                        Label("Filter", systemImage: "line.3.horizontal.decrease")
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
