//
//  DessertDetailView.swift
//  MealDB-API
//
//  Created by Khang Nguyen Huynh on 5/21/23.
//

import SwiftUI

struct DessertDetailView: View {
    var meal: MealModel
    @StateObject private var viewModel: ViewModel
    
    init(meal: MealModel) {
        self.meal = meal
        _viewModel = StateObject(wrappedValue: ViewModel(meal: meal))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                DessertRemoteImage(url: meal.strMealThumb!)
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                
                Text(meal.strMeal)
                    .font(.largeTitle)
                    .bold()
                
                Section {
                    ForEach(viewModel.ingredients) { ingredient in
                        HStack {
                            Text(ingredient.name)
                                .bold()
                            Text(ingredient.quantity)
                        }
                    }
                } header: {
                    Text("Ingredients")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                }
                
                Section {
                    Text(viewModel.instructions)
                } header: {
                    Text("Instructions")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .padding()
                
            }
            .task {
                await viewModel.fetchMealDetails()
            }
        }
    }
}

struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailView(meal: MealModel.example)
    }
}
