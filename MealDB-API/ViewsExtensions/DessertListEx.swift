//
//  DessertListEx.swift
//  MealDB-API
//
//  Created by Khang Nguyen Huynh on 5/21/23.
//

import Foundation

extension DessertListView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var meals = [MealModel]()
        @Published var category = MealModelCategory.Dessert
        @Published var changingCategory = false
        
        var urlString: String {
            "https://themealdb.com/api/json/v1/1/filter.php?c=\(category)"
        }
        
        func fetchMealCategory() async {
            func handleSuccess(_ mealList: MealModelCategoryQuery) -> Void {
                self.meals = mealList.mealModels.filter({
                    $0.strMealThumb != nil
                }).sorted()
            }
            
            await fetch(from: urlString, onSuccess: handleSuccess)
        }
        
        func setCategory(category: MealModelCategory) {
            self.category = category
        }
    }
}
