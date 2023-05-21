//
//  IngredientModel.swift
//  MealDB-API
//
//  Created by Khang Nguyen Huynh on 5/21/23.
//

import Foundation
struct IngredientModel: Codable, Comparable {
    let name: String
    let quantity: String
    
    static func <(lhs: IngredientModel, rhs: IngredientModel) -> Bool {
        lhs.name < rhs.name
    }
}

extension IngredientModel: Identifiable {
    var id: UUID {
        UUID()
    }
}
