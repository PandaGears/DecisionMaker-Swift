//
//  ContentView.swift
//  DecisionMaker
//
//  Created by Tamara Radloff on 2022/07/08.
//

import SwiftUI

struct Main: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                    Button("add activity"){
                        addNewWord()
                    }
                }

                Section {
                    ForEach(usedWords, id: \.self) { word in
                        Text(word)
                    }
                }
                Section {
                    Button("Decision Makenator") {
                        rootWord = usedWords[Int.random(in: 0..<usedWords.count)]
                    }
                }
            }
            .navigationTitle(rootWord).font(.headline)
            .background(.black)
        }
    }
    
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.uppercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // exit if the remaining string is empty
        guard answer.count > 0 else { return }

        // extra validation to come

        usedWords.insert(answer, at: 0)
        newWord = ""
    }
}

struct Main_Preview: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
