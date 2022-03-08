//
//  RecipeDetailsView.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import SwiftUI

struct RecipeDetailsView: View {
    var recipe:RecipeModel
    @State var showDetailsView=false
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ImageCover(image: recipe.image, name: recipe.name)
                
                VStack(alignment: .leading){
                    
                    Button {
                        showDetailsView = true
                    } label: { CustomButton(text: "Calories 1445 for 4 Servings") }
                    
                    DescriptionView()
                    IngredientsView()

                    Button {
                        
                    } label: {
                        CustomButton(text: "More Info")
                    }

                    
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



struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0){
            Text("Description")
                .font(.title2)
            VStack(alignment: .leading, spacing: 5.0){
                Text("Meal Type :- lunch/dinner")
                Text("Dish Type :- salad")
                Text("cuisine Type :- american/mediterranean")
                Text("cautions :- Sulfites")
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
    var body: some View {
        Section {
                ForEach(1..<5){_ in
                    IngredientsCard()
                
            }
                .padding(.horizontal,5)
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
