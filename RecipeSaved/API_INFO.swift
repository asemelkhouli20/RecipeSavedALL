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
    
    
    static func getApi(search:String?,fillter:[String]?)->String{
        
        var urlAPI = "https://api.edamam.com/api/recipes/v2?type=public&beta=false&q=\(search ?? "random")&app_id=\(API_ID)&app_key=\(API_KEY)&random=true"
        if let filter=fillter{
            
            //in fillterView is :-  fillter=[mealTypePicker,dishTypePicker,cuisineTypePicker]
            let mealType = filter[0]
            let dishType = filter[1].replacingOccurrences(of: " ", with: "%20")
            let cuisineType = filter[2].replacingOccurrences(of: " ", with: "%20")
            if mealType != ""{
                urlAPI=urlAPI+"&mealType="+mealType
            }
            if dishType != ""{
                urlAPI=urlAPI+"&dishType="+dishType
            }
            if cuisineType != ""{
                urlAPI=urlAPI+"&cuisineType="+cuisineType
            }
            
        }
        return urlAPI
    }
   
}
