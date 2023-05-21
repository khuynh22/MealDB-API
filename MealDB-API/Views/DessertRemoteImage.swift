//
//  DessertRemoteImage.swift
//  MealDB-API
//
//  Created by Khang Nguyen Huynh on 5/21/23.
//

import SwiftUI

struct DessertRemoteImage: View {
    var url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
                case .failure:
                    Text("Image Display Error")
                        .font(.largeTitle)
                case .success(let image):
                    image
                        .resizable()
                default:
                    ProgressView()
            }
        }
    }
}

struct DessertRemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        DessertRemoteImage(url: MealModel.example.strMealThumb!)
    }
}
