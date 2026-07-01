//
//  RecipeManager.swift
//  Recipe Manager
//
//  Created by Anjali Minakshi on 30/06/26.
//
import Combine
import Foundation
import SwiftUI

class RecipeManager: ObservableObject {
//    @Published var recipes: [Recipe] = SampleRecipes.recipes
    @Published var recipes: [Recipe] = []
    private let storageKey = "SavedRecipes"
    
    init() {
        loadRecipes()
    }
    
    private func loadRecipes() {

        guard let data = UserDefaults.standard.data(forKey: storageKey) else {

            recipes = SampleRecipes.recipes
            return

        }

        do {

            recipes = try JSONDecoder().decode([Recipe].self, from: data)

        } catch {

            recipes = SampleRecipes.recipes

        }

    }
    
    func logout() {

        UserDefaults.standard.removeObject(forKey: storageKey)

        recipes = SampleRecipes.recipes

    }
    
    
    private func saveRecipes() {

        do {

            let data = try JSONEncoder().encode(recipes)

            UserDefaults.standard.set(data, forKey: storageKey)

        } catch {

            print("Failed to save recipes")

        }

    }
    
    func addRecipe(
        title: String,
        category: RecipeCategory,
        cookingTime: Int,
        ingredients: [String],
        notes: String?,
        imageData: Data?
    ) throws {
        
        let cleanTitle = title.trimmed()
        
        guard !cleanTitle.isEmpty else {
            throw RecipeError.emptyTitle
        }
        
        guard !ingredients.isEmpty else {
            throw RecipeError.emptyIngredients
        }
        
        guard cookingTime > 0 else {
            throw RecipeError.invalidCookingTime
        }
        
        let recipe = Recipe(
            title: cleanTitle.capitalizeFirstLetter(),
            category: category,
            cookingTime: cookingTime,
            ingredients: ingredients,
            notes: notes?.trimmed(),
            imageName: "recipePlaceholder",
            imageData: imageData,
            isFavorite: false
        )
        
        recipes.append(recipe)
        saveRecipes() //writing this again and again for imediate storage updation
    }
    
    // MARK: - Delete Recipe
    
    func deleteRecipe(at offsets: IndexSet) {
        recipes.remove(atOffsets: offsets)
        saveRecipes()
    }
    
    // MARK: - Delete Recipe by Object
    
    func deleteRecipe(_ recipe: Recipe) {
        
        if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
            recipes.remove(at: index)
            saveRecipes()
        }
    }
    
    // MARK: - Toggle Favorite
    
    func toggleFavorite(for recipe: Recipe) {
        
        guard let index = recipes.firstIndex(where: { $0.id == recipe.id }) else {
            return
        }
        
        recipes[index].isFavorite.toggle()
        saveRecipes()
    }
    
    // MARK: - Search Recipes
    
    func searchRecipes(searchText: String) -> [Recipe] {
        
        let text = searchText.trimmed()
        
        if text.isEmpty {
            return recipes
        }
        
        return recipes.filter {
            $0.title.localizedCaseInsensitiveContains(text)
        }
    }
}
