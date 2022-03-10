//
//  RecipeList.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

struct RecipeList: View {
    var recipes : [Recipe]=[]
    var isFav:Bool
    var body: some View {
            if recipes.count != 0 {
                ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160),spacing: 15)],spacing: 15) {
                    ForEach(recipes) { itemIN in
                        NavigationLink(destination: RecipeDetailsView(recipe: itemIN, isFav: isFav)) { RecipesCard(recipe: itemIN) }
                    }
                    
                }
                .padding()
                .padding(.top)
                    
                }
                
            }else if !isFav{
                VStack{
                    Image("not_found")
                        .resizable()
                        .scaledToFit()
                    Text("Not Found if you use many filter try less them and if not please pressed refresh button")
                        .font(.title3)
                        .fontWeight(.thin)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
            }
          
        
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipeList(isFav: false)
        }
    }
}
