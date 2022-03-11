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
        //make search is valid to API url
        var ser = search
        if ser == "" || ser == nil { ser = "random" }
        //make basic  API url
        var urlAPI = "https://api.edamam.com/api/recipes/v2?type=public&beta=false&q=\(ser!)&app_id=\(API_ID)&app_key=\(API_KEY)&random=true"
        //add fillter to API url
        if let filter=fillter,filter != []{
            //convert fillter and delete all space in name and make it a variable to add it to API url
            //in fillterView is :-  fillter=[mealTypePicker,dishTypePicker,cuisineTypePicker]
            let mealType    = filter[0]
            let dishType    = filter[1].replacingOccurrences(of: " ", with: "%20")
            let cuisineType = filter[2].replacingOccurrences(of: " ", with: "%20")
            //add the filters to API URL
            if mealType    != "" { urlAPI = urlAPI+"&mealType="+mealType       }
            if dishType    != "" { urlAPI = urlAPI+"&dishType="+dishType       }
            if cuisineType != "" { urlAPI = urlAPI+"&cuisineType="+cuisineType }
        }
        return urlAPI
    }
   
}
