//
//  ContentView.swift
//  JokesAppSwiftUI
//
//  Created by XECE on 17.05.2025.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject var jokesViewModel = JokesViewModel()

    var body: some View {
        NavigationView {
            List(jokesViewModel.jokes) { joke in
                NavigationLink(destination: DetailView(joke: joke, viewModel: jokesViewModel)) {
                    VStack(alignment: .leading) {
                        Text(joke.originalText)
                        if jokesViewModel.isFavorite(joke: joke) {
                            Image(systemName: "heart.fill").foregroundColor(.red)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Jokes")
                        .font(.title2)
                        .italic()
                        .fontWeight(.semibold)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        jokesViewModel.addNewJokes()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .alert(item: $jokesViewModel.errorMessage) { error in
                Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
            }
        }
    }
}
