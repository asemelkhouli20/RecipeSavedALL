//
//  RecipeDetailsView.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

struct RecipeDetailsView: View {
    
    @FetchRequest(sortDescriptors: []) var data : FetchedResults<RecipeModel>
    @Environment(\.managedObjectContext) var moc
    
    var recipe:Recipe
    
    @State var isSaved = false
    @State var showDetailsView=false
    
    @Binding var isFav:Bool
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ImageCover(image: recipe.image, name: recipe.label)
                
                VStack(alignment: .leading){
                    
                    Button {
                        showDetailsView = true
                    } label: { CustomButton(text: "Calories \( String(format: "%0.0f",recipe.calories)) for \(recipe.yield) Servings") }
                    
                    DescriptionView(meal: Help.getString(array: recipe.mealType) , dish: Help.getString(array: recipe.dishType), cuisine: Help.getString(array: recipe.cuisineType), cautions: Help.getString(array: recipe.cautions))
                    IngredientsView(ingredients: recipe.ingredients)

                   
                    Link(destination: URL(string: recipe.url)! ) {
                            CustomButton(text: "More Info")
                        }
                   

                    
                }
                .background(Color(uiColor: .systemBackground))
                .offset(x: 0, y: -10)
                
            }
            .sheet(isPresented: $showDetailsView) {
                Details(recipe: recipe)
            }
            
            .toolbar {
                ToolbarItem{
                    if isFav {
                        Button {
                            //delete item from CoreData and make it unFav and than out
                            for item in data {
                                if item.lable == recipe.label { moc.delete(item);try? moc.save(); isFav = false;isSaved = false; break } }
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                                .font(.headline)
                                .padding(8)
                                .background(Color.white)
                                .clipShape(Circle())
                        }

                    }else{
                        Button {
                            if !isSaved{
                                // create new data and add it to coreData
                                let new = RecipeModel(context: moc); new.base = Help.encoderData(save: recipe)!; new.lable = recipe.label; try? moc.save()
                                //change the status
                                isFav = true; isSaved = true
                            }
                            
                        } label: {
                            Label("Save", systemImage: isSaved ? "heart.circle.fill" : "heart.circle")
                                .font(.title2)
                                .padding(5)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                    }
                
                        
                   
                    
                    

                }
            }
            
            
            
        }
        .ignoresSafeArea(.container,edges: .top)
    }
}




struct DescriptionView: View {
    var meal:String
    var dish:String
    var cuisine:String
    var cautions:String
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0){
            Text("Description")
                .font(.title2)
            VStack(alignment: .leading, spacing: 5.0){
                Text("Meal Type :- \(meal)")
                Text("Dish Type :- \(dish)")
                Text("Cuisine Type :- \(cuisine)")
                if cautions != "" {
                    Text("Cautions :- \(cautions)")
                }
                
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

struct ImageCover: View {
    var image:String
    var name:String
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: image)! ) { image in
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
            Text(name)
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0),Color.black.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
            
            
        }
    }
}

struct CustomButton: View {
    var text:String
    var body: some View {
        HStack(){
            Text(text)
            
            Spacer()
            Image(systemName: "ellipsis")
        }
        .font(.title3)
        .frame(maxWidth:.infinity,alignment: .leading)
        .foregroundColor(.white)
        .padding()
        .background(Color("primary"))
    }
}

struct IngredientsView: View {
    var ingredients : [Ingredients]
    var body: some View {
        Section {
            if ingredients.count >= 1 {
                ForEach(0..<ingredients.count){i in
                        IngredientsCard(ingredients: ingredients[i])
                        
                    
                }
                    .padding(.horizontal,5)
            }
            
        } header: {
            Text("Ingredients")
                .font(.title3)
                .frame(maxWidth:.infinity,alignment: .leading)
                .foregroundColor(.white)
                .padding()
                .background(Color("primary"))
        }
    }
}
