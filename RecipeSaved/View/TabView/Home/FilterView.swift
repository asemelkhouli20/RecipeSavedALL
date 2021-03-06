//
//  FilterView.swift
//  RecipeSaved
//
//  Created by Asem on 09/03/2022.
//

import SwiftUI

struct FilterView: View {
    @State private var mealTypePicker=""
    @State private var dishTypePicker=""
    @State private var cuisineTypePicker=""
    @Binding var fillter:[String]
    
    @Binding var showFilter:Bool
    var body: some View {
        VStack{
            List {
                filterType(picker: $mealTypePicker, array: Help.mealType, text: "meal type")
                filterType(picker: $dishTypePicker, array: Help.dishType, text: "dish Type")
                filterType(picker: $cuisineTypePicker, array: Help.cuisineType, text: "cuisine Type")
               
            }
            Button {
               fillter=[mealTypePicker,dishTypePicker,cuisineTypePicker]
                
                showFilter=false
            } label: {
                Label("Filter", systemImage: "line.3.horizontal.decrease")
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color("primary"))
                    .cornerRadius(20)
                    .padding()
            }
            
        }
        .background(Color(uiColor: .systemBackground))
        
        
    }
}
struct filterType: View {
    @Binding var picker:String
    var array:[String]
    var text:String
    var body: some View {
        Section {
            Picker("dishType", selection: $picker) {
                Text("all \(text)").tag("")
                ForEach(array,id: \.self) { i in
                    Text(i).tag(i)
                }
            }
            .pickerStyle(.menu)
        } header: {
            Text(text)
        }
    }
}
