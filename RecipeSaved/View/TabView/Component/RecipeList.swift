//
//  RecipeList.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

struct RecipeList: View {
    var recipes : [Recipe]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160),spacing: 15)],spacing: 15) {
                if recipes.count != 0 {
                    ForEach(recipes) { itemIN in
                        NavigationLink(destination: RecipeDetailsView(recipe: itemIN)) {
                            RecipesCard(recipe: itemIN)
                            
                        }
                        
                    }
                    
                }
                
            }
            .padding()
            .padding(.top)
                
            
            
        }
    }
}
//
//struct RecipeList_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//        RecipeList(recipes: [RecipeModel.MockData])
//        }
//    }
//}
