//
//  DataViewModel.swift
//  RecipeSaved
//
//  Created by Asem on 11/03/2022.
//

import SwiftUI

class DataViewModel : ObservableObject {
    
    let data = CoreDataManger()
    
    func get()->[Recipe]{return data.getAllData() }
    func save(_ recipe:Recipe){ data.save(recipe: recipe) }
    
    func delete(_ lable:String){data.delete(at: lable) }
    
}
