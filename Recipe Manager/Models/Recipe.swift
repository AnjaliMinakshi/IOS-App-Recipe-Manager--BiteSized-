//
//  Recipe.swift
//  Recipe Manager
//
//  Created by Anjali Minakshi on 30/06/26.
//

import Foundation


enum RecipeCategory: String, CaseIterable, Identifiable, Codable {
    
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case snacks = "Snacks"
    case dessert = "Dessert"
    case drinks = "Drinks"
    
    var id: String{
        rawValue
    }
}

struct Recipe: Identifiable, Codable {
    let id = UUID()
    
    var title: String
    var category: RecipeCategory
    var cookingTime: Int
    var ingredients: [String]
    var notes: String?
    var imageName: String
    var imageData: Data?
    var isFavorite: Bool
    
}
