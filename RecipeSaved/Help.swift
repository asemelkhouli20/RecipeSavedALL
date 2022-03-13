//
//  Help.swift
//  RecipeSaved
//
//  Created by Asem on 09/03/2022.
//

import Foundation

class Help {
    static let mealType = ["Breakfast","Lunch","Dinner","Snack","Teatime"]
    
    static let dishType = ["Alcohol-cocktail","Biscuits and cookies","Bread","Cereals","Condiments and sauces","Drinks","Desserts","Egg","Main course","Omelet","Pancake","Preps","Preserve","Salad","Sandwiches","Soup","Starter"]
    
    static let cuisineType = ["American","Asian","British","Caribbean","Central Europe","Chinese","Eastern Europe","French","Indian","Italian","Japanese","Kosher","Mediterranean","Mexican","Middle Eastern","Nordic","South American","South East Asian"]
    
    static let defualt = UserDefaults.standard
    
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
            //make sure all colour elment to be on the top of array
            if mir.label == "Fat" || mir.label=="Carbs" || mir.label=="Protein" || mir.label.rangeOfCharacter(from: ["V"]) != nil || mir.label == "Energy"{ array.insert(mir, at: i); i+=1
            }else{ array.append(miro.value as! DetailsItem) }
        }
        return array
    }
    static func getDictionary(b:TotalDaily)->[String:DetailsItem]{
        let itemShowSecond = Help.getString(a: b)
        var finallArray = [String:DetailsItem]()
        for i in 0..<itemShowSecond.count { finallArray[itemShowSecond[i].label]=itemShowSecond[i] }
        return finallArray
    }
    
    
    
    static func getData(data:Data)->Recipe?{
        if let decodar = try? JSONDecoder().decode(Recipe.self, from: data){ return decodar }
        return nil
    }
    
    static func encoderData(save recipe:Recipe)->Data?{
        if let encoded = try? JSONEncoder().encode(recipe){ return encoded }
        return nil
    }
}
