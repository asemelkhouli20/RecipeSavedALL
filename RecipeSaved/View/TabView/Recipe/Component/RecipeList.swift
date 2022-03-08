//
//  RecipeList.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

struct RecipeList: View {
    var recipes : [RecipeModel]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160),spacing: 15)],spacing: 15) {
                if recipes.count != 0 {
                    ForEach(1..<recipes.count) { index in
                        NavigationLink(destination: RecipeDetailsView(recipe: recipes[index])) {
                            RecipesCard(recipe: recipes[index])
                        }
                    }
                }
                
            }
            .padding()
            .padding(.top)
                
            
            
        }
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        RecipeList(recipes: [RecipeModel.MockData])
    }
}
