//
//  RecipeCardView.swift
//  Recipe Manager
//
//  Created by Anjali Minakshi on 01/07/26.
//

import SwiftUI

struct RecipeCardView: View {

    let recipe: Recipe

    var body: some View {

        HStack(spacing: 15) {

//            Image(recipe.imageName)
//                .resizable()
//                .scaledToFill()
//                .frame(width: 70, height: 70)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
            if let imageData = recipe.imageData,
               let uiImage = UIImage(data: imageData) {

                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

            } else {

                Image(recipe.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

            }

            VStack(alignment: .leading, spacing: 8) {

                Text(recipe.title)
                    .font(.headline)

                HStack {

                    Label(recipe.category.rawValue,
                          systemImage: "tag.fill")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Spacer()

                    Label("\(recipe.cookingTime) min",
                          systemImage: "clock")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()

            if recipe.isFavorite {

                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .font(.title3)

            }

        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.08),
                radius: 4,
                x: 0,
                y: 2)

    }
}

#Preview {

    RecipeCardView(
        recipe: Recipe(
            title: "Pizza",
            category: .dinner,
            cookingTime: 20,
            ingredients: [
                "Cheese",
                "Bread",
                "Tomato"
            ],
            notes: "Very Delicious",
            imageName: "pizza",
            isFavorite: true
        )
    )

}
