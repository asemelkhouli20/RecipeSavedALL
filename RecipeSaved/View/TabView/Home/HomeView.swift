//
//  FavouritesView.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var recipe : [Recipe]?
    var body: some View {
        NavigationView{
            ZStack{
                if recipe != nil {
                    RecipeList(recipes: recipe!, isFav: true)
                }
                if recipe?.count == 0 {
                    VStack{
                        Image("fav")
                            .resizable()
                            .scaledToFit()
                        Text("add the meal your like it from home and back to it anytime")
                            .font(.title3)
                            .fontWeight(.thin)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                }
            }
            
            
                .onAppear {
                    let i = Help.defualt.value(forKey: "geti") ?? 0
                    let data = Help.getData(numberOfItem: i as! Int)
                        recipe=data
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
