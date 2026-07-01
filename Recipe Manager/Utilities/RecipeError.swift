//
//  RecipeError.swift
//  Recipe Manager
//
//  Created by Anjali Minakshi on 30/06/26.
//

import Foundation

enum RecipeError: LocalizedError{
    
    case emptyTitle
    case emptyIngredients
    case invalidCookingTime
    
    var errorDescription: String? {
        switch self {
        case .emptyTitle:
            return "Recipe title cannot be empty."
            
        case .emptyIngredients:
            return "Please add at least one ingredient."
            
        case .invalidCookingTime:
            return "Cooking time must be greater than 0."
        }
    }
}
