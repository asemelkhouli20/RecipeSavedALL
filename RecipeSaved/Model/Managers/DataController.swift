//
//  CoreDataManger.swift
//  RecipeSaved
//
//  Created by Asem on 11/03/2022.
//

import Foundation
import CoreData

class DataController : ObservableObject {
    
    let continer = NSPersistentContainer(name: "RecipeModelCoreData")
    
    init(){
        continer.loadPersistentStores { _, error in
            if let error = error { print(error) }
        }
    }
}
