//
//  HomeView.swift
//  Recipe Manager
//
//  Created by Anjali Minakshi on 01/07/26.
//

import SwiftUI

struct HomeView: View {

    @StateObject private var recipeManager = RecipeManager()

    @State private var searchText = ""
    @State private var showAddRecipe = false

    private var filteredRecipes: [Recipe] {
        recipeManager.searchRecipes(searchText: searchText)
    }

    var body: some View {

        NavigationStack {

            Group {

                if filteredRecipes.isEmpty {

                    ContentUnavailableView(
                        "No Recipes Found",
                        systemImage: "fork.knife.circle",
                        description: Text("Tap the + button to add your first recipe.")
                    )

                } else {

                    List {

                        ForEach(filteredRecipes) { recipe in

                            NavigationLink {

                                RecipeDetailView(
                                    recipeManager: recipeManager,
                                    recipe: recipe
                                )

                            } label: {

                                RecipeCardView(recipe: recipe)

                            }
                            .listRowSeparator(.hidden)

                        }
                        .onDelete(perform: recipeManager.deleteRecipe)

                    }
                    .listStyle(.plain)

                }

            }
            .navigationTitle("🍽 BiteSized")
            .searchable(
                text: $searchText,
                prompt: "Search Recipes"
            )
//            .toolbar {
//
//                ToolbarItem(placement: .topBarTrailing) {
//
//                    Button {
//
//                        showAddRecipe = true
//
//                    } label: {
//
//                        Image(systemName: "plus")
//
//                    }
//
//                }
//
//            }
            .toolbar {

                ToolbarItemGroup(placement: .topBarTrailing) {

                    Button {

                        recipeManager.logout()

                    } label: {

                        Image(systemName: "rectangle.portrait.and.arrow.right")

                    }

                    Button {

                        showAddRecipe = true

                    } label: {

                        Image(systemName: "plus")

                    }

                }

            }
            
            
            .sheet(isPresented: $showAddRecipe) {

                AddRecipeView(
                    recipeManager: recipeManager
                )

            }

        }

    }

}

#Preview {

    HomeView()

}
