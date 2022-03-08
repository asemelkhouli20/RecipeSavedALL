//
//  RecipeDetailsView.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

struct RecipeDetailsView: View {
    var recipe:RecipeModel
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                VStack{
                    AsyncImage(url: URL(string: recipe.image)! ) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                        
                    } placeholder: {
                        Image("cutlery")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 100, height: 100, alignment: .center)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(height:300)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0),Color.black.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
                }
                .overlay(alignment: .bottom) {
                    Text(recipe.name)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0),Color.black.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
                    
                    
                }
                
                VStack(alignment: .leading){
                    if(recipe.description != ""){
                        DescriptionView(description: recipe.description)
                    }
                    if(recipe.ingredients != []){
                        SectioonContain(contain: recipe.ingredients, header: "Ingredients")                    }
                    if(recipe.directions != []){
                        SectioonContain(contain: recipe.directions, header: "Directions")                    }
                    
                    
                    
                    
                    
                    
                    
                }
                .background(Color(uiColor: .systemBackground))
                .offset(x: 0, y: -10)
                
            }
            
            
            
        }
        .ignoresSafeArea(.container,edges: .top)
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(recipe: RecipeModel.MockData)
            .preferredColorScheme(.dark)
    }
}

struct SectioonContain: View {
    var contain : [String]
    var header:String
    var body: some View {
        Section {
            ForEach(contain,id: \.self){item in
                Text(item)
                Divider()
            }
            .padding(.horizontal,25)
            
        } header: {
            HStack{
                Text(header)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical,9)
            .background(Color("primary"))
            .padding(.bottom)
            
        }
    }
}

struct DescriptionView: View {
    var description:String
    var body: some View {
        Section {
            Text(description)
                .padding(.vertical,0.1)
                .padding(.horizontal)
                .padding(.bottom)
        } header: {
            HStack{
                Text("Description")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical,9)
            .background(Color("primary"))
            .padding(.bottom)
        }
    }
}
