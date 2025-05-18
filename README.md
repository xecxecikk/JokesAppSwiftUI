# JokeApp – Programming Jokes in SwiftUI

JokeApp is a minimalist iOS app written entirely in **SwiftUI** that fetches random programming jokes using a public API and allows users to:

- View jokes in a clean, scrollable list
- Read full jokes in a dedicated detail screen
- **Add or remove jokes from favorites**
- **Listen to jokes aloud using text-to-speech**

This project demonstrates networking, simple state management, view composition, and basic accessibility integration (speech synthesis).

---

## 🚀 Features

### ✅ Joke Listing
- Fetches programming jokes from [JokeAPI](https://jokeapi.dev/)
- Supports `single` format jokes
- "+" button in the top-right corner to load more jokes

### 🧠 Detail View
- Displays selected joke
- Includes two interactive buttons:
  - ❤️ Favorite/Unfavorite the joke
  - 🗣️ Speak aloud (English)

### 📌 Favorites
- Jokes can be marked/unmarked as favorites
- Favorite state is reflected with a red heart icon in the list

### 🗣️ Speech
- Uses `AVSpeechSynthesizer` from `AVFoundation`
- Language: English (`en-US`)
- Toggle: Start/Stop reading aloud

---

## 📦 Dependencies

This app uses **one external package**:

### 🔗 [Alamofire](https://github.com/Alamofire/Alamofire)
- Used to perform HTTP requests to the JokeAPI
- Easy JSON decoding with `responseDecodable`

#### 📥 How to add Alamofire via Swift Package Manager
1. In Xcode: `File > Add Packages`
2. Paste the URL:
   ```
   https://github.com/Alamofire/Alamofire.git
   ```
3. Choose latest version
4. Import in code where necessary:
   ```swift
   import Alamofire
   ```

---

## 🛠 Architecture

This is a small but modular SwiftUI project with the following structure:

| File                  | Responsibility                                     |
|-----------------------|-----------------------------------------------------|
| `Joke.swift`          | Joke model (decodable + originalText logic)        |
| `JokesViewModel.swift` | Fetching jokes, state management, favorites         |
| `ContentView.swift`   | Main UI with list and toolbar                      |
| `DetailView.swift`    | Detailed view of joke with read/favorite buttons   |
| `ErrorMessage.swift`  | Error model for SwiftUI alert compatibility        |

State management is handled via `@Published` + `@ObservedObject` without Redux or external architecture.

---

## 🔧 Running the App

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/JokeApp.git
   ```

2. Open in Xcode (iOS 15+ recommended)
3. Add Alamofire (via SPM as described above)
4. Run on a simulator or real device

---


## 🤝 Credits

- [JokeAPI](https://jokeapi.dev/) – for awesome joke data
- [Alamofire](https://github.com/Alamofire/Alamofire) – for clean networking
- Apple – for `SwiftUI` and `AVFoundation`

---



## 💡 Next Improvements (optional roadmap)

- [ ] Add persistent favorites (UserDefaults or Core Data)
- [ ] Add category filter (e.g., Dark, Pun, Misc)
- [ ] Offline joke caching
- [ ] UI refinements & animations
