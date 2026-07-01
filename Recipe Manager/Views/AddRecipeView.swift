//
//  AddRecipeView.swift
//  Recipe Manager
//
//  Created by Anjali Minakshi on 01/07/26.
//

import SwiftUI
import PhotosUI
struct AddRecipeView: View {

    @ObservedObject var recipeManager: RecipeManager
    @Environment(\.dismiss) private var dismiss

    @State private var title = ""
    @State private var category: RecipeCategory = .breakfast
    @State private var cookingTime = ""
    @State private var ingredients = ""
    @State private var notes = ""
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var imageData: Data?

    @State private var showAlert = false
    @State private var errorMessage = ""

    var body: some View {

        NavigationStack {

            Form {
                
                Section("Recipe Photo") {

                    if let selectedImage {

                        selectedImage
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 12))

                    } else {

                        Image("recipePlaceholder")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 12))

                    }

                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images
                    ) {

                        Label("Choose Photo", systemImage: "photo")

                    }

                }

                Section("Recipe Information") {

                    CustomTextField(
                        title: "Recipe Title",
                        text: $title
                    )

                    Picker("Category", selection: $category) {

                        ForEach(RecipeCategory.allCases) { category in

                            Text(category.rawValue)
                                .tag(category)

                        }

                    }

                    TextField(
                        "Cooking Time (Minutes)",
                        text: $cookingTime
                    )
                    .keyboardType(.numberPad)

                }

                Section("Ingredients") {

                    TextEditor(text: $ingredients)
                        .frame(height: 120)

                }

                Section("Notes (Optional)") {

                    TextEditor(text: $notes)
                        .frame(height: 120)

                }

                Section {

                    Button {

                        saveRecipe()

                    } label: {

                        HStack {

                            Spacer()

                            Label(
                                "Save Recipe",
                                systemImage: "plus.circle.fill"
                            )
                            .font(.headline)

                            Spacer()

                        }

                    }
                    .buttonStyle(.borderedProminent)

                }

            }
            .navigationTitle("Add Recipe")
            .onChange(of: selectedItem) {

                Task {

                    if let data = try? await selectedItem?.loadTransferable(type: Data.self) {

                        imageData = data

                        if let uiImage = UIImage(data: data) {

                            selectedImage = Image(uiImage: uiImage)

                        }

                    }

                }

            }
            .navigationBarTitleDisplayMode(.inline)
            .alert("Error", isPresented: $showAlert) {

                Button("OK", role: .cancel) { }

            } message: {

                Text(errorMessage)

            }

        }

    }

    private func saveRecipe() {

        let ingredientList = ingredients
            .split(separator: "\n")
            .map { String($0).trimmed() }
            .filter { !$0.isEmpty }

        do {

            try recipeManager.addRecipe(
                title: title,
                category: category,
                cookingTime: Int(cookingTime) ?? 0,
                ingredients: ingredientList,
                notes: notes.isEmpty ? nil : notes,
                imageData: imageData
            )

            dismiss()

        }
        catch {

            errorMessage = error.localizedDescription
            showAlert = true

        }

    }

}

#Preview {

    AddRecipeView(
        recipeManager: RecipeManager()
    )

}
