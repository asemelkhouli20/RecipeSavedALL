//
//  IngredientsCard.swift
//  RecipeSaved
//
//  Created by Asem on 08/03/2022.
//

import SwiftUI

struct IngredientsCard: View {
    var body: some View {
        HStack{
            ImageCoverCompont()
                .foregroundColor(Color("primary"))
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.horizontal,5)
            Text("1 (15-ounce) can black-eyed peas, drained and rinsed")
            VStack{
                Text("width")
                Text("289.25")
            }
            .padding(10)
            .foregroundColor(.white)
            .background(Color("primary")
            )
            
        }
        .overlay(RoundedRectangle(cornerRadius: 5,style: .continuous)
                    .stroke(Color("primary"),lineWidth: 1)
        )
    }
}

struct IngredientsCard_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsCard()
            .preferredColorScheme(.dark)
    }
}

struct ImageCoverCompont: View {
    var body: some View {
        AsyncImage(url: URL(string:"https://www.edamam.com/food-img/9f6/9f6181163a25c96022ee3fc66d9ebb11.jpg")) { image in
            image
                .resizable()
                .scaledToFit()
            
        } placeholder: {
            Image(systemName: "photo.circle.fill")
                .resizable()
            
        }
       
    }
}
