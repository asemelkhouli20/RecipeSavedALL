//
//  addRecipe.swift
//  RecipeSaved
//
//  Created by Asem on 05/03/2022.
//

import SwiftUI

struct AddRecipe: View {
    @Environment(\.dismiss) var dismiss
    
    @State var name = ""
    @State var description = ""
    @State var ingredients = ""
    @State var directions = ""
    @State var select = ""
    var body: some View {
        NavigationView{
            Form{
                Section { TextField("title of recipe", text: $name) } header: { Text("recipe name") }
                
                Picker(selection: $select) {
                    ForEach(Catagory.allCases, id: \.self) {item in Text(item.rawValue) }
                } label: { Text("Category") }.pickerStyle(.menu)
                
                Section { TextEditor(text: $description) } header:  { Text("Description") }
                Section { TextEditor(text: $ingredients) } header:  { Text("Ingredients") }
                Section { TextEditor(text: $directions ) } header:  { Text("Directions" ) }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: { Label("cancel", systemImage: "xmark") }
                }
                
                ToolbarItem{
                    Button {
                        
                    } label: { Label("Save", systemImage: "checkmark") }.disabled(name.isEmpty)
                }
            })
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("New Recipe")
        }
        .navigationViewStyle(.stack)
    }
}

struct addRecipe_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipe()
    }
}
