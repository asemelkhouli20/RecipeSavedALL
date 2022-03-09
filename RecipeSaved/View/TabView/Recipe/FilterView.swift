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
    var body: some View {
        VStack{
            List {
                filterType(picker: mealTypePicker, array: API_INFO.mealType, text: "meal type")
                filterType(picker: dishTypePicker, array: API_INFO.dishType, text: "dish Type")
                filterType(picker: cuisineTypePicker, array: API_INFO.cuisineType, text: "cuisine Type")
               
            }
            Button {
                
                
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

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}

struct filterType: View {
    @State var picker:String
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
