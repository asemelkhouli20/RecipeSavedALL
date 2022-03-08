//
//  RecipeModel.swift
//  RecipeSaved
//
//  Created by Asem on 04/03/2022.
//

import Foundation
import SwiftUI

enum Catagory: String,CaseIterable {
    case breakfast = "breakfast"
    case soup = "Soup"
    case salad = "salad"
    case appetizer = "appetizer"
    case main = "main"
    case side = "side"
    case dessert = "dessert"
    case snack = "snack"
    case drink = "drink"
    
}

struct RecipeModel : Identifiable {
    let id = UUID()
    let name:String
    let image:String
    let description:String
    let ingredients:[String]
    let directions:[String]
    let catagories:Catagory
    let datePublished:String
    let url:String
    
    static let MockData = RecipeModel(name: "Very Veggie Mock Chicken Salad", image: "https://sparkpeo.hs.llnwd.net/e4/nw/7/7/l779683255.jpg", description: "One of my favorite summertime lunches, stuffed inside a pita pocket with some lettuce or spinach!", ingredients: ["1 package (8 oz) tempeh ","2 T cottage cheese ","2 T light miracle whip ","1 stalk broccoli, very finely chopped ","1 large carrot, grated ","2-3 medium stalks celery, diced ","2-3 slices onion, diced ","1/4-1/2 cup grated zucchini ","10-15 grape tomatoes, quartered ","8-10 sprigs parsley, finely shredded ","1 T olive oil ","1 T cumin (or to taste) ","1 T curry (or to taste) ","dash of black and/or cayenne pepper"], directions: ["1. Cut tempeh into 1/2 inch cubes. Add about 1-2 cups water to a saucepot, just enough to cover tempeh. Bring to a boil, add tempeh, and simmer for 15 minutes."," 2. Heat oil in skillet, and add drained tempeh. Stir-fry about 5 minutes, until tempeh begins to turn golden-brown. Cool completely.. "," 3. Blend together cottage cheese, miracle whip, cumin, curry, and pepper until creamy. Add all other ingredients, stir very well to mix. Refrigerate for at least one hour before serving. "," Serving Size: Makes 4 servings of about 1/2 cup"], catagories: .breakfast , datePublished: "ToDay", url: "https://recipes.sparkpeople.com/recipe-detail.asp?recipe=2477051")
    
    static let all = [RecipeModel.MockData,RecipeModel.MockData,RecipeModel.MockData,RecipeModel.MockData,RecipeModel.MockData,RecipeModel.MockData,RecipeModel.MockData,RecipeModel.MockData]
}

