//
//  DessertDetailEx.swift
//  MealDB-API
//
//  Created by Khang Nguyen Huynh on 5/21/23.
//

import SwiftUI

extension DessertDetailView {
    @MainActor class ViewModel: ObservableObject {
        private var meal: MealModel
        
        private var detailsURL: String {
            "https://themealdb.com/api/json/v1/1/lookup.php?i=\(self.meal.idMeal)"
        }
        
        @Published private(set) var instructions: String
        @Published private(set) var ingredients: [IngredientModel]
        
        init(meal: MealModel) {
            self.meal = meal
            self.instructions = ""
            self.ingredients = [IngredientModel]()
            
            func fetchMealDetails() async {
                func handleSuccess(_ items: NetworkResponse) -> Void {
                    if let details = items.meals.first {
                        setInstructions(using: details)
                        setIngredients(using: details)
                    }
                }
                
                await fetch(from: detailsURL, onSuccess: handleSuccess)
            }
            
            private func setInstructions(using details: NetworkResponse) {
                self.strInstructions = details.strInstructions
            }
            
            private func setIngredients(using details: NetworkResponse) {
                let ingredMeasurements = [
                    IngredientModel(name: details.strIngredient1, quantity: details.strMeasure1),
                    IngredientModel(name: details.strIngredient2, quantity: details.strMeasure2),
                    IngredientModel(name: details.strIngredient3, quantity: details.strMeasure3),
                    IngredientModel(name: details.strIngredient4, quantity: details.strMeasure4),
                    IngredientModel(name: details.strIngredient5, quantity: details.strMeasure5),
                    IngredientModel(name: details.strIngredient6, quantity: details.strMeasure6),
                    IngredientModel(name: details.strIngredient7, quantity: details.strMeasure7),
                    IngredientModel(name: details.strIngredient8, quantity: details.strMeasure8),
                    IngredientModel(name: details.strIngredient9, quantity: details.strMeasure9),
                    IngredientModel(name: details.strIngredient10, quantity: details.strMeasure10),
                    IngredientModel(name: details.strIngredient11, quantity: details.strMeasure11),
                    IngredientModel(name: details.strIngredient12, quantity: details.strMeasure12),
                    IngredientModel(name: details.strIngredient13, quantity: details.strMeasure13),
                    IngredientModel(name: details.strIngredient14, quantity: details.strMeasure14),
                    IngredientModel(name: details.strIngredient15, quantity: details.strMeasure15),
                ]
                
                
                self.ingredients = ingredMeasurements.filter { !($0.name.removeEmpty() || $0.quantity.removeEmpty()) }
            }
            
        }
    }
}
