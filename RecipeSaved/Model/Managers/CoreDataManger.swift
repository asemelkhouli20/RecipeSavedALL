//
//  CoreDataManger.swift
//  RecipeSaved
//
//  Created by Asem on 11/03/2022.
//

import Foundation
import CoreData

class CoreDataManger {
    let persistentContainer : NSPersistentContainer
    init(){
        persistentContainer=NSPersistentContainer(name: "RecipeModelCoreData")
        persistentContainer.loadPersistentStores { descripthion, error in
            if let error = error { fatalError("core data faild \(error)") }
        }
    }

    func save(recipe:Recipe){
        let recipeModel = RecipeModel(context: persistentContainer.viewContext)
        if let encoder = try? JSONEncoder().encode(recipe){
            recipeModel.lable = recipe.label
            recipeModel.base = encoder
            do{ try persistentContainer.viewContext.save() }catch{ print(error) }
        }

    }
    
    func getAllData()->[Recipe]{
        var array = [Recipe]()
        let fetchRequest:NSFetchRequest<RecipeModel> = RecipeModel.fetchRequest()
        do{
            let data = try persistentContainer.viewContext.fetch(fetchRequest)
            for item in data { if let decodar = try? JSONDecoder().decode(Recipe.self, from: item.base){ array.append(decodar) } }
        }catch{ print(error) }
        return array
    }
    func delete(at lable:String){
        
            let fetchRequest:NSFetchRequest<RecipeModel> = RecipeModel.fetchRequest()
            do{
                let data = try persistentContainer.viewContext.fetch(fetchRequest)
                for item in data { if item.lable == lable { persistentContainer.viewContext.delete(item) } }
                do{ try persistentContainer.viewContext.save() } catch{ print(error) }
            }catch{ print(error) }
            
       
    }
}
