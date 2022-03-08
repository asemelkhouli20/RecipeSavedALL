//
//  Recipe.swift
//  RecipeSaved
//
//  Created by Asem on 08/03/2022.
//

import Foundation

struct Recipe:Decodable,Identifiable {
    var id = UUID()
    let label:String
    let image:String
    let url:String
    let yield:Int
    let cautions:[String]
    let ingredients:[Ingredients]
    let calories:Double
    let cuisineType:[String]
    let mealType:[String]
    let dishType:[String]
    let totalNutrients:[TotalNutrients]
    let totalDaily:[TotalDaily]
    let digest:[Digest]
}
struct Ingredients:Decodable{
    let text:String
    let weight:Double
    let image:String
}
struct Digest:Decodable{
    let label:String
    let schemaOrgTag:String
    let total:Double
    let hasRDI:Bool
    let daily:Double
    let unit:String
    let sub:[Digest]
}
struct TotalNutrients:Decodable{
    let ENERC_KCAL:     DetailsTotalNutrients
    let FAT:            DetailsTotalNutrients
    let FASAT:          DetailsTotalNutrients
    let FATRN:          DetailsTotalNutrients
    let FAMS:           DetailsTotalNutrients
    let FAPU:           DetailsTotalNutrients
    let CHOCDF:         DetailsTotalNutrients
//    let CHOCDF.net:   DetailsTotalNutrients
    let FIBTG:          DetailsTotalNutrients
    let SUGAR:          DetailsTotalNutrients
//    let SUGAR.added:  DetailsTotalNutrients
    let PROCNT:         DetailsTotalNutrients
    let CHOLE:          DetailsTotalNutrients
    let NA:             DetailsTotalNutrients
    let CA:             DetailsTotalNutrients
    let MG:             DetailsTotalNutrients
    let K:              DetailsTotalNutrients
    let FE:             DetailsTotalNutrients
    let ZN:             DetailsTotalNutrients
    let P:              DetailsTotalNutrients
    let VITA_RAE:       DetailsTotalNutrients
    let VITC:           DetailsTotalNutrients
    let THIA:           DetailsTotalNutrients
    let RIBF:           DetailsTotalNutrients
    let NIA:            DetailsTotalNutrients
    let VITB6A:         DetailsTotalNutrients
    let FOLDFE:         DetailsTotalNutrients
    let FOLFD:          DetailsTotalNutrients
    let FOLAC:          DetailsTotalNutrients
    let VITB12:         DetailsTotalNutrients
    let VITD:           DetailsTotalNutrients
    let TOCPHA:         DetailsTotalNutrients
    let VITK1:          DetailsTotalNutrients
//    let Sugar.alcohol:DetailsTotalNutrients
    let WATER:          DetailsTotalNutrients

}
struct TotalDaily:Decodable{
    let ENERC_KCAL: DetailsTotalNutrients
    let FAT:        DetailsTotalNutrients
    let FASAT:      DetailsTotalNutrients
    let CHOCDF:     DetailsTotalNutrients
    let FIBTG:      DetailsTotalNutrients
    let PROCNT:     DetailsTotalNutrients
    let CHOLE:      DetailsTotalNutrients
    let NA:         DetailsTotalNutrients
    let CA:         DetailsTotalNutrients
    let MG:         DetailsTotalNutrients
    let K:          DetailsTotalNutrients
    let FE:         DetailsTotalNutrients
    let ZN:         DetailsTotalNutrients
    let P:          DetailsTotalNutrients
    let VITA_RAE:   DetailsTotalNutrients
    let VITC:       DetailsTotalNutrients
    let THIA:       DetailsTotalNutrients
    let RIBF:       DetailsTotalNutrients
    let NIA:        DetailsTotalNutrients
    let VITB6A:     DetailsTotalNutrients
    let FOLDFE:     DetailsTotalNutrients
    let VITB12:     DetailsTotalNutrients
    let VITD:       DetailsTotalNutrients
    let TOCPHA:     DetailsTotalNutrients
    let VITK1:      DetailsTotalNutrients

}

struct DetailsTotalNutrients:Decodable{
    let label:String
    let quantity:Double
    let unit:String
    
}
