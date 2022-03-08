//
//  API_INFO.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import Foundation

struct API_INFO {
    
    static let API_KEY = "ef816e5fbc756632771868a28fbf5d54"
    static let API_ID = "7b0337dd"
    
    static func getApi(search:String?)->String{
        
        let urlAPI = "https://api.edamam.com/api/recipes/v2?type=public&beta=false&q=\(search ?? "random")&app_id=\(API_ID)&app_key=\(API_KEY)&random=true"
        return urlAPI
    }
    static func getString(array:[String])->String{
        var string = ""
        for a in array {
            string=string+a
        }
        return string
    }
}


//hits[0].recipe.label
//hits[0].recipe.image
//-- hits[0].recipe.shareAs
//hits[1].recipe.yield
//hits[1].recipe.ingredientLines --> array
//hits[1].recipe.ingredients --> make it
//hits[1].recipe.calories
//hits[1].recipe.mealType
//hits[1].recipe.dishType
//hits[1].recipe.totalNutrients
//hits[1].recipe.digest


//recipe.url

