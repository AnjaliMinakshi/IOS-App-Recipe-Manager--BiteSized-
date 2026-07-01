//
//  RecipeDetailView.swift
//  Recipe Manager
//
//  Created by Anjali Minakshi on 01/07/26.
//

import SwiftUI

struct RecipeDetailView: View {

    @ObservedObject var recipeManager: RecipeManager
    let recipe: Recipe

    @State private var imageScale: CGFloat = 1.0

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 20) {

                GeometryReader { geometry in

                    Group {

                        if let imageData = recipe.imageData,
                           let uiImage = UIImage(data: imageData) {

                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()

                        } else {

                            Image(recipe.imageName)
                                .resizable()
                                .scaledToFill()

                        }

                    }
                    .frame(
                        width: geometry.size.width,
                        height: 250
                    )
                    .clipped()
                    .scaleEffect(imageScale)
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                imageScale = value
                            }
                            .onEnded { _ in
                                withAnimation {
                                    imageScale = 1
                                }
                            }
                    )

                }
                .frame(height: 250)

                VStack(alignment: .leading, spacing: 15) {

                    HStack {

                        Text(recipe.title)
                            .font(.largeTitle)
                            .bold()

                        Spacer()

                        Button {

                            recipeManager.toggleFavorite(for: recipe)

                        } label: {

                            Image(systemName:
                                    recipe.isFavorite ?
                                  "heart.fill" :
                                  "heart")
                                .font(.title)
                                .foregroundColor(.red)

                        }

                    }

                    Divider()

                    Label(
                        recipe.category.rawValue,
                        systemImage: "tag.fill"
                    )

                    Label(
                        "\(recipe.cookingTime) Minutes",
                        systemImage: "clock.fill"
                    )

                    Divider()

                    Text("Ingredients")
                        .font(.title2)
                        .bold()

                    ForEach(recipe.ingredients, id: \.self) { ingredient in

                        HStack {

                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)

                            Text(ingredient)

                        }

                    }

                    if let notes = recipe.notes,
                       !notes.isEmpty {

                        Divider()

                        Text("Notes")
                            .font(.title2)
                            .bold()

                        Text(notes)

                    }

                }
                .padding()

            }

        }
        .navigationTitle("Recipe Details")
        .navigationBarTitleDisplayMode(.inline)

    }

}

#Preview {

    NavigationStack {

        RecipeDetailView(
            recipeManager: RecipeManager(),
            recipe: Recipe(
                title: "Pizza",
                category: .dinner,
                cookingTime: 20,
                ingredients: [
                    "Cheese",
                    "Bread",
                    "Tomato"
                ],
                notes: "Serve Hot",
                imageName: "pizza",
                imageData: nil,
                isFavorite: false
            )
        )

    }

}
