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
    
    static let mealType = ["Breakfast","Lunch","Dinner","Snack","Teatime"]
    
    static let dishType = ["Alcohol-cocktail","Biscuits and cookies","Bread","Cereals","Condiments and sauces","Drinks","Desserts","Egg","Main course","Omelet","Pancake","Preps","Preserve","Salad","Sandwiches","Soup","Starter"]
    
    static let cuisineType = ["American","Asian","British","Caribbean","Central Europe","Chinese","Eastern Europe","French","Indian","Italian","Japanese","Kosher","Mediterranean","Mexican","Middle Eastern","Nordic","South American","South East Asian"]
    
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
    static func getString(a:Any)->[DetailsItem]{
        var array = [DetailsItem]()
        let mirro = Mirror(reflecting: a)
        var i=0
        for miro in mirro.children {
            let mir = miro.value as! DetailsItem
            
            if mir.label == "Fat" || mir.label=="Carbs" || mir.label=="Protein" || mir.label.rangeOfCharacter(from: ["V"]) != nil || mir.label == "Energy"{
                array.insert(mir, at: i)
                i+=1
            }else{
                array.append(miro.value as! DetailsItem)
                
            }
        }
        return array
    }
    static func getDictionary(b:TotalDaily)->[String:DetailsItem]{
        let itemShowSecond = API_INFO.getString(a: b)
        var finallArray = [String:DetailsItem]()
        for i in 0..<itemShowSecond.count {
            finallArray[itemShowSecond[i].label]=itemShowSecond[i]
        }
        return finallArray
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

