//
//  Details.swift
//  RecipeSaved
//
//  Created by Asem on 08/03/2022.
//

import SwiftUI

struct Details: View {
    var recipe:Recipe
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 320))],spacing: 5) {
                let itemShow = Help.getString(a: recipe.totalNutrients)
                let itemShowSecond = Help.getDictionary(b: recipe.totalDaily)
                ForEach(itemShow,id:\.label) { index in
                        
                    if index.label.range(of: "Vitamin") != nil{
                        
                        CustomItemView(name: index.label, unit: index.unit, quantity: index.quantity,percent: String(format: "%0.1f%%", itemShowSecond[index.label]?.quantity ?? 0)   )
                            .foregroundColor(.white)
                            .background(Color.gray)
                    }else if index.label=="Fat" || index.label == "Energy"{
                        CustomItemView(name: index.label, unit: index.unit, quantity: index.quantity,percent: String(format: "%0.1f%%", itemShowSecond[index.label]?.quantity ?? 0)   )
                            .foregroundColor(.white)
                            .background(Color.teal)
                    }else if index.label == "Protein" {
                        CustomItemView(name: index.label, unit: index.unit, quantity: index.quantity,percent: String(format: "%0.1f%%", itemShowSecond[index.label]?.quantity ?? 0)   )
                            .foregroundColor(.white)
                            .background(Color.green)
                    }else if index.label == "Carbs" {
                        CustomItemView(name: index.label, unit: index.unit, quantity: index.quantity,percent: String(format: "%0.1f%%", itemShowSecond[index.label]?.quantity ?? 0)   )
                            .foregroundColor(.white)
                            .background(Color.orange)
                    }
                    else {
                        
                        CustomItemView(name: index.label, unit: index.unit, quantity: index.quantity,percent: String(format: "%0.1f%%", itemShowSecond[index.label]?.quantity ?? 0)   )
                            .overlay(RoundedRectangle(cornerRadius: 0)
                                        .stroke(.gray)
                            )
                    }
                   
                }
                
                
            }
            .padding()
            Button(action: {
                dismiss()
            }, label: {
                Text("Done")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth:.infinity)
                    .font(.title3)
                    .background(Color("primary"))
                
            })
            
            
        }
        
        
        
        
        
        
        
    }
}
struct CustomItemView: View {
    var name:String
    var unit:String
    var quantity:Double
    var percent:String
    var body: some View {
        HStack(spacing: 10){
            Text("\(name)"+":")
                .bold()
                .lineLimit(1)
            Spacer()
            Text("\(String(format: "%0.2f\(unit)",quantity))")
            Text(percent)

        }
        .font(.callout)
        .padding()
        .frame(maxWidth:.infinity)
        
    }
}
