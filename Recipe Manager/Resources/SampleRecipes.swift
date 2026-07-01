//
//  SampleRecipes.swift
//  Recipe Manager
//
//  Created by Anjali Minakshi on 01/07/26.
//

import Foundation

struct SampleRecipes {

    static let recipes: [Recipe] = [

        Recipe(
            title: "Margherita Pizza",
            category: .dinner,
            cookingTime: 20,
            ingredients: [
                "Pizza Base",
                "Tomato Sauce",
                "Mozzarella Cheese",
                "Basil Leaves"
            ],
            notes: "Bake until cheese melts.",
            imageName: "pizza",
            imageData: nil,
            isFavorite: false
        ),

        Recipe(
            title: "Veg Sandwich",
            category: .breakfast,
            cookingTime: 10,
            ingredients: [
                "Bread",
                "Tomato",
                "Onion",
                "Cheese"
            ],
            notes: "Serve with ketchup.",
            imageName: "sandwitch",
            imageData: nil,
            isFavorite: true
        ),

        Recipe(
            title: "Pasta Alfredo",
            category: .dinner,
            cookingTime: 25,
            ingredients: [
                "Pasta",
                "Milk",
                "Cream",
                "Garlic",
                "Cheese"
            ],
            notes: nil,
            imageName: "pasta",
            imageData: nil,
            isFavorite: false
        ),

        Recipe(
            title: "Fruit Salad",
            category: .dessert,
            cookingTime: 5,
            ingredients: [
                "Apple",
                "Banana",
                "Orange",
                "Grapes"
            ],
            notes: "Serve chilled.",
            imageName: "salad",
            imageData: nil,
            isFavorite: false
        )

    ]

}
