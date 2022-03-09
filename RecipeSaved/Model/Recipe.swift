//
//  Recipe.swift
//  RecipeSaved
//
//  Created by Asem on 08/03/2022.
//

import Foundation
struct main:Decodable{
    let from:Int
    let to:Int
    let count:Int
    let hits:[item]
}
struct item:Decodable{
    let recipe:Recipe
}

struct Recipe:Decodable,Identifiable {
    let id=UUID()
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
    let totalNutrients:TotalNutrients
    let totalDaily:TotalDaily
    let digest:[Digest]
}
struct Ingredients:Decodable{
    let text:String
    let weight:Double
    let image:String?
}
struct Digest:Decodable{
    let label:String
    let schemaOrgTag:String?
    let total:Double
    let hasRDI:Bool
    let daily:Double
    let unit:String
    let sub:[Digest]?
}
struct TotalNutrients:Decodable{
    let ENERC_KCAL:     DetailsItem
    let FAT:            DetailsItem
    let FASAT:          DetailsItem
    let FATRN:          DetailsItem
    let FAMS:           DetailsItem
    let FAPU:           DetailsItem
    let CHOCDF:         DetailsItem
//    let CHOCDF.net:   DetailsTotalNutrients
    let FIBTG:          DetailsItem
    let SUGAR:          DetailsItem
//    let SUGAR.added:  DetailsTotalNutrients
    let PROCNT:         DetailsItem
    let CHOLE:          DetailsItem
    let NA:             DetailsItem
    let CA:             DetailsItem
    let MG:             DetailsItem
    let K:              DetailsItem
    let FE:             DetailsItem
    let ZN:             DetailsItem
    let P:              DetailsItem
    let VITA_RAE:       DetailsItem
    let VITC:           DetailsItem
    let THIA:           DetailsItem
    let RIBF:           DetailsItem
    let NIA:            DetailsItem
    let VITB6A:         DetailsItem
    let FOLDFE:         DetailsItem
    let FOLFD:          DetailsItem
    let FOLAC:          DetailsItem
    let VITB12:         DetailsItem
    let VITD:           DetailsItem
    let TOCPHA:         DetailsItem
    let VITK1:          DetailsItem
//    let Sugar.alcohol:DetailsTotalNutrients
    let WATER:          DetailsItem

}
struct TotalDaily:Decodable{
    let ENERC_KCAL: DetailsItem
    let FAT:        DetailsItem
    let FASAT:      DetailsItem
    let CHOCDF:     DetailsItem
    let FIBTG:      DetailsItem
    let PROCNT:     DetailsItem
    let CHOLE:      DetailsItem
    let NA:         DetailsItem
    let CA:         DetailsItem
    let MG:         DetailsItem
    let K:          DetailsItem
    let FE:         DetailsItem
    let ZN:         DetailsItem
    let P:          DetailsItem
    let VITA_RAE:   DetailsItem
    let VITC:       DetailsItem
    let THIA:       DetailsItem
    let RIBF:       DetailsItem
    let NIA:        DetailsItem
    let VITB6A:     DetailsItem
    let FOLDFE:     DetailsItem
    let VITB12:     DetailsItem
    let VITD:       DetailsItem
    let TOCPHA:     DetailsItem
    let VITK1:      DetailsItem

}

struct DetailsItem:Decodable{
    let label:String
    let quantity:Double
    let unit:String
    
}
