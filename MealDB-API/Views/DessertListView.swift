//
//  ContentView.swift
//  MealDB-API
//
//  Created by Khang Nguyen Huynh on 5/20/23.
//

import SwiftUI

struct DessertListView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.meals, id: \.id) { meal in
                    NavigationLink {
                        MealDetailView(meal: meal)
                            .navigationTitle(meal.name)
                    } label: {
                        Text("\(meal.name)")
                    }
                }
            }
            .navigationTitle("\(viewModel.category.rawValue) Recipes")
            .toolbar {
                Button("Change category") {
                    viewModel.changingCategory = true
                }
            }
            .task {
                await viewModel.fetchMealCategory()
            }
        }
        .onChange(of: viewModel.category) { _ in
            Task {
                await viewModel.fetchMealCategory()
            }
        }
        .sheet(isPresented: $viewModel.changingCategory) {
            ChangeCategoryForm(category: $viewModel.category, isPresented: $viewModel.changingCategory)
        }
    }
}

struct DessertListView_Previews: PreviewProvider {
    static var previews: some View {
        DessertListView()
    }
}
