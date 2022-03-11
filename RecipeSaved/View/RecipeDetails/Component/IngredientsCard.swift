//
//  IngredientsCard.swift
//  RecipeSaved
//
//  Created by Asem on 08/03/2022.
//

import SwiftUI

struct IngredientsCard: View {
    var ingredients : Ingredients
    var body: some View {
        HStack{
            ImageCoverCompont(image: ingredients.image)
                .foregroundColor(Color("primary"))
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.horizontal,5)
            Text(ingredients.text)
            Spacer()
            
            VStack{
                Text("Width")
                Text(String(format: "%0.1fg",ingredients.weight))
            }
            .padding()
            .frame(minWidth:90)
            .foregroundColor(.white)
            .background(Color("primary"))
            
        }
        .frame(maxWidth:.infinity)
        .overlay(RoundedRectangle(cornerRadius: 5,style: .continuous).stroke(Color("primary"),lineWidth: 1))
        
    }
}


struct ImageCoverCompont: View {
    var image:String?
    var body: some View {
        AsyncImage(url: URL(string:image ?? "")) { image in
            image.resizable().scaledToFit()
        } placeholder: {
            Image(systemName: "photo.circle.fill").resizable()
            
        }
       
    }
}
