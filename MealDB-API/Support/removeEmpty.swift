//
//  removeEmpty.swift
//  MealDB-API
//
//  Created by Khang Nguyen Huynh on 5/20/23.
//

import Foundation

extension String {
    func removeEmpty() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
