//
//  MealModel.swift
//  MealDB-API
//
//  Created by Khang Nguyen Huynh on 5/20/23.
//
// Using Dessert API: https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert

import Foundation

struct MealModel: Codable, Comparable {
    let strMeal: String
    let strMealThumb: String?
    let idMeal: String
    
    enum CodingKeys: String, CodingKey {
        case strMeal = "strMeal"
        case strMealThumb = "strMealThumb"
        case idMeal = "idMeal"
    }
    
    static func <(lhs: MealModel, rhs: MealModel) -> Bool {
        lhs.strMeal < rhs.strMeal
    }
    
    static let example = MealModel(strMeal: "Apam balik",
                                   strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                                   idMeal: "53049")
}

struct MealModelCategoryQuery: Codable {
    let mealModels: [MealModel]
}

enum MealModelCategory: String, CaseIterable {
    case Beef = "Beef"
    case Breakfast = "Breakfast"
    case Chicken = "Chicken"
    case Dessert = "Dessert"
    case Goat = "Goat"
    case Lamb = "Lamb"
    case Miscellaneous = "Miscellaneous"
    case Pasta = "Pasta"
    case Pork = "Pork"
    case Seafood = "Seafood"
    case Side = "Side"
    case Starter = "Starter"
    case Vegan = "Vegan"
    case Vegetarian = "Vegetarian"
}
