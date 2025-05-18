//
//  JokesViewModel.swift
//  JokesAppSwiftUI
//
//  Created by XECE on 17.05.2025.
//

import Foundation
import Alamofire

class JokesViewModel: ObservableObject {
    @Published var jokes = [Joke]()
    @Published var errorMessage: ErrorMessage?
    @Published var favorites = [Joke]()

    func getJokes(count: Int = 4) {
        for _ in 0..<count {
            let url = "https://v2.jokeapi.dev/joke/Programming?type=single"

            AF.request(url)
                .validate()
                .responseDecodable(of: Joke.self) { response in
                    switch response.result {
                    case .success(let data):
                        DispatchQueue.main.async {
                            self.jokes.append(data)
                        }
                    case .failure(let error):
                        DispatchQueue.main.async {
                            self.errorMessage = ErrorMessage(message: "Failed to fetch jokes: \(error.localizedDescription)")
                        }
                    }
                }
        }
    }

    func addNewJokes(count: Int = 1) {
        getJokes(count: count)
    }

    func toggleFavorite(joke: Joke) {
        if let index = favorites.firstIndex(of: joke) {
            favorites.remove(at: index)
        } else {
            favorites.append(joke)
        }
    }

    func isFavorite(joke: Joke) -> Bool {
        favorites.contains(joke)
    }
}
