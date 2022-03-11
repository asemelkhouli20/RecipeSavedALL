//
//  RecipeModel+CoreDataProperties.swift
//  RecipeSaved
//
//  Created by Asem on 11/03/2022.
//
//

import Foundation
import CoreData


extension RecipeModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeModel> {
        return NSFetchRequest<RecipeModel>(entityName: "RecipeModel")
    }

    @NSManaged public var base: Data
    @NSManaged public var lable: String

}

extension RecipeModel : Identifiable {

}
