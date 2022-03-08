//
//  RecipesCard.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

struct RecipesCard: View {
    var recipe:RecipeModel
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: recipe.image)! ) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        Text(recipe.name)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .frame(maxWidth: 130)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0),Color.black.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
                    }
                
                
            } placeholder: {
                Image("cutlery")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40, alignment: .center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(width: 160, height: 220, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color.secondary.opacity(0.8),Color.gray.opacity(0.1)]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
        
    }
}

struct RecipesCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipesCard(recipe: RecipeModel.MockData)
            .preferredColorScheme(.dark)
    }
}
