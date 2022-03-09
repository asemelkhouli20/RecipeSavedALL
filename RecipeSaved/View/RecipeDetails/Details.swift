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
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 300))],spacing: 5) {
                let itemShow = API_INFO.getString(a: recipe.totalNutrients)
                let itemShowSecond = API_INFO.getDictionary(b: recipe.totalDaily)
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
//
//struct Details_Previews: PreviewProvider {
//    static var previews: some View {
//        Details()
//    }
//}
//


struct CustomItemView: View {
    var name:String
    var unit:String
    var quantity:Double
    var percent:String
    var body: some View {
        HStack(spacing: 10){
            Text("\(name)"+":")
                .bold()
            Spacer()
            Text("\(String(format: "%0.2f\(unit)",quantity))")
            Text(percent)

        }
        .font(.callout)
        .padding()
        .frame(maxWidth:.infinity)
        .overlay(RoundedRectangle(cornerRadius: 0)
                    .stroke()
        )
    }
}
