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
                ForEach(viewModel.meals, id: \.idMeal) { meal in
                    NavigationLink {
                        DessertDetailView(meal: meal)
                            .navigationTitle(meal.strMeal)
                    } label: {
                        Text("\(meal.strMeal)")
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

struct ChangeCategoryForm: View {
    @Binding var category: MealModelCategory
    @Binding var isPresented: Bool
    
    var body: some View {
        Form {
            Picker("Category", selection: $category) {
                ForEach(MealModelCategory.allCases, id: \.rawValue) {
                    Text($0.rawValue)
                        .tag($0)
                }
            }
            Button("Done") {
                isPresented = false
            }
        }
    }
}

struct DessertListView_Previews: PreviewProvider {
    static var previews: some View {
        DessertListView()
    }
}
