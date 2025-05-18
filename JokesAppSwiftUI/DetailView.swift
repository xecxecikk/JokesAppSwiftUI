//
//  DetailView.swift
//  JokesAppSwiftUI
//
//  Created by XECE on 18.05.2025.
//

import SwiftUI
import AVFoundation

struct DetailView: View {
    let joke: Joke
    @ObservedObject var viewModel: JokesViewModel
    @State private var isSpeaking = false
    private let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Joke Detail")
                .font(.largeTitle)

            Text(joke.originalText)

            Spacer()

            HStack {
                Button(isSpeaking ? "Stop" : "Read Aloud") {
                    speakJoke()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button(viewModel.isFavorite(joke: joke) ? "Unfavorite" : "Favorite") {
                    viewModel.toggleFavorite(joke: joke)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Joke")
        .navigationBarTitleDisplayMode(.inline)
    }

    func speakJoke() {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
            isSpeaking = false
        } else {
            let utterance = AVSpeechUtterance(string: joke.originalText)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            synthesizer.speak(utterance)
            isSpeaking = true
        }
    }
}
