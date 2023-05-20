//
//  fetchSupport.swift
//  MealDB-API
//
//  Created by Khang Nguyen Huynh on 5/20/23.
//

import Foundation

func fetch<T: Codable> (from urlStr: String, onSuccess: @MainActor @escaping (T) -> Void) async -> Void {
    guard let url = URL(string: urlStr) else {
        print("The URL: \(urlStr) is invalid, unable to fetch!")
        return
    }
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(T.self, from: data)
        
        await onSuccess(decoded)
    } catch {
        print(error.localizedDescription)
    }
}
