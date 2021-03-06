//
//  FavouritesView.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

struct favouriteView: View {
    @FetchRequest(sortDescriptors: []) var data : FetchedResults<RecipeModel>
    
    @State var recipe : [Recipe]?
    
    @State var alertShow=false
    @State var isFav = true
    var body: some View {
        NavigationView{
            ZStack{
                if recipe != nil { RecipeList(recipes: recipe!, isFav: $isFav) }
                if recipe?.count == 0 {
                    VStack{
                        Image("fav").resizable().scaledToFit()
                        Text("add the meal your like it from home and back to it anytime").font(.title3).fontWeight(.thin)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                }
            }
            .onAppear {
                isFav = true
                recipe=[]
                //get all data and convert it from CoreData
                for elment in data { let ite = Help.getData(data: elment.base); recipe?.append(ite!) }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        favouriteView()
    }
}
