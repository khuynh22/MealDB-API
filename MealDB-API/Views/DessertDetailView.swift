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
                    .frame(width: 250, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                
                Section {
                    ForEach(viewModel.ingredients) { ingredient in
                        HStack {
                            Text(ingredient.name)
                            Text(" - ")
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
        DessertDetailView()
    }
}
