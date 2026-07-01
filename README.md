# 🍽️ BiteSized - Recipe Manager App

A modern Recipe Manager application built using **SwiftUI** following the **MVVM (Model-View-ViewModel)** architecture. The app allows users to add, view, search, favorite, and delete recipes while demonstrating core iOS development concepts and SwiftUI best practices.

---

## 📱 Features

- ➕ Add new recipes
- 📖 View recipe details
- 🔍 Search recipes by title
- ❤️ Mark and unmark recipes as favorites
- 🗑️ Delete recipes using swipe actions
- 🖼️ Optional Photo Picker for custom recipe images
- 📷 Placeholder image when no photo is selected
- 📝 Add ingredients and optional notes
- 🍽️ Categorize recipes (Breakfast, Lunch, Dinner, Dessert)
- ⏱️ Display cooking time
- 🔍 Pinch-to-zoom gesture on recipe images
- 📱 Responsive SwiftUI interface
- ⚠️ Input validation with custom error handling

---

## 🏗️ Project Architecture

The project follows the **MVVM Architecture**.

Recipe Manager
│
├── Models
│      Recipe.swift
│
├── ViewModels
│      RecipeManager.swift
│
├── Views
│      HomeView.swift
│      AddRecipeView.swift
│      RecipeDetailView.swift
│      RecipeCardView.swift
│      CustomTextField.swift
│
├── Resources
│      SampleRecipes.swift
│
├── Utilities
│      RecipeError.swift
│
├── Extensions
│      String+Extension.swift
│
└── Recipe_ManagerApp.swift


---

## 🛠️ Technologies Used

- Swift
- SwiftUI
- MVVM Architecture
- PhotosUI Framework
- NavigationStack
- GeometryReader
- ObservableObject
- State Management
- Error Handling
- Swift Extensions

---

## 📚 SwiftUI Concepts Implemented

### Swift Fundamentals
- Variables & Constants
- Functions
- Control Flow
- Arrays
- Structs
- Classes
- Optionals
- Error Handling
- Protocols
- Extensions

### SwiftUI
- VStack
- HStack
- ZStack
- ScrollView
- List
- NavigationStack
- NavigationLink
- Sheet Presentation
- Form
- TextField
- TextEditor
- Picker
- Button
- GeometryReader
- Searchable
- Gestures
- Image Assets
- PhotosPicker

### State Management

- `@State`
- `@Binding`
- `@StateObject`
- `@ObservedObject`
- `@Published`

---

## 📂 CRUD Operations

| Operation | Description                     |
|-----------|---------------------------------|
| Create    | Add a new recipe                |
| Read      | View recipes and recipe details |
| Update    | Toggle favorite status          |
| Delete    | Swipe to delete recipes         |

---

## 📸 Screenshots

Home Screen
<img width="283" height="575" alt="Screenshot 2026-07-01 at 6 03 56 PM" src="https://github.com/user-attachments/assets/ecc3d3f4-200d-40c0-9d25-cee0e9c3b4e2" />

Add Recipe Screen
<img width="289" height="572" alt="Screenshot 2026-07-01 at 6 04 30 PM" src="https://github.com/user-attachments/assets/0a224aec-2211-4e50-955f-60adf4671ce7" />

Recipe Detail Screen
<img width="285" height="575" alt="Screenshot 2026-07-01 at 6 04 55 PM" src="https://github.com/user-attachments/assets/8be18733-c63d-4b91-af77-bda53881d9be" />

Removing Recipe
<img width="280" height="577" alt="Screenshot 2026-07-01 at 6 06 02 PM" src="https://github.com/user-attachments/assets/233ab0eb-b706-45b3-a9dd-8417a47283f8" />

Splash Screen
<img width="280" height="578" alt="Screenshot 2026-07-01 at 6 09 04 PM" src="https://github.com/user-attachments/assets/0da9fb06-3586-4d61-ab31-fa7441b84fd1" />

---

## 🚀 Future Improvements

- Edit existing recipes
- Persistent local storage using SwiftData/Core Data
- Category filters
- Sorting options
- Dark Mode support
- Recipe sharing
- Cloud synchronization
- User authentication

---

## 🎯 Learning Outcomes

This project helped me gain practical experience with:

- Building complete SwiftUI applications
- MVVM Architecture
- State Management
- Reusable UI Components
- Navigation
- Image Picker Integration
- Error Handling
- Custom Views
- SwiftUI Layout System
- Git & GitHub

---

## 👩‍💻 Author

**Anjali Minakshi**

Aspiring iOS Developer passionate about building modern SwiftUI applications and continuously learning Apple's development ecosystem.

---

## ⭐ If you like this project

Feel free to ⭐ star the repository and share your feedback!
