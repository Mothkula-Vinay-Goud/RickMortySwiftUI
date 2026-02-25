# Rick & Morty Character Search App (SwiftUI + MVVM)

## 📱 Overview
This is an iOS application built using **SwiftUI** and **MVVM architecture**.

The app allows users to:
- Search for characters from the Rick and Morty API
- View character details
- Handle loading, empty, and error states properly

The project demonstrates modern iOS development practices using SwiftUI.

---

## 🚀 Features

- 🔍 Search characters by name
- 🖼 Display character image
- 📄 Show character details:
  - Name
  - Species
  - Status
  - Origin
- ⏳ Loading indicator while fetching data
- ❌ Proper error handling with alert
- 📭 “No Characters Found” state when search returns empty
- 🔁 Retry button when API fails

---

## 🏗 Architecture

This project follows **MVVM (Model-View-ViewModel)** architecture.

### Model
- Codable structs to decode API response

### ViewModel
- Handles:
  - API calls
  - State management
  - Business logic
- Uses async/await for networking

### View
- Built completely in SwiftUI
- Uses:
  - List
  - NavigationStack
  - AsyncImage
  - Alert
  - ProgressView

---

## 🌐 API Used

Rick and Morty Public API:
https://rickandmortyapi.com/

Example endpoint:
https://rickandmortyapi.com/api/character/?name=rick

---

## 🧠 State Handling

The app handles multiple states:

- Loading
- Success
- Empty
- Failed

UI updates automatically based on state changes using @Published properties.

---

## 🛠 Technologies Used

- Swift
- SwiftUI
- MVVM
- Async/Await
- URLSession
- Codable
- NavigationStack

---

## 📸 Screens

1. Search Screen
2. Character List
3. Character Detail Screen
4. Error Alert Screen

---

## 🎯 What I Learned

- Migrating from UIKit MVVM to SwiftUI MVVM
- State management in SwiftUI
- Alert handling
- Async image loading
- Proper error and empty state UI handling

---

## 👨‍💻 Author

Vinay Goud Mothkula  
iOS Developer | SwiftUI | UIKit | MVVM

---

## 📌 Future Improvements

- Pagination support
- Unit testing
- Debounce search
- Dark mode enhancements

---

⭐ If you like this project, feel free to star the repository!
## Demo
![Simulator Screen Recording - iPhone 17 Pro - 2026-02-25 at 15 50 31](https://github.com/user-attachments/assets/6d2fba8b-9639-48dc-9f2c-41d9f1ca3da9)
