//
//  ContentView.swift
//  RickMortySwiftUI
//
//  Created by Vinay Goud Mothkula on 2/24/26.
//

import SwiftUI

struct ContentView: View {
    
    // Create the ViewModel
    @State private var viewModel = CharacterViewModel()
    @State private var hasLoadedInitialData = false
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // The list of characters
                if viewModel.isLoading {
                    // Show loading indicator
                    ProgressView("Please Wait...")
                        .progressViewStyle(CircularProgressViewStyle())
                    Spacer()
                } else {
                    
                    if let error = viewModel.errorMessage {
                        Text(error)
                            .onAppear {
                                showAlert = true   // Trigger immediately
                            }
                            .alert("Hello", isPresented: $showAlert) {
                                Button("OK", role: .cancel) { }
                            } message: {
                                Text("There was an Error While Fetching the Data. Please Try Again Later.")
                            }
                    }
                    
                    // Show the list of characters
                    List(viewModel.characters) { character in
                        NavigationLink {
                            CharacterDetailView(character: character)
                        } label: {
                            CharacterRow(character: character)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Rick and Morty")
            .searchable(text: $viewModel.searchText, prompt: "Search characters...")
            .onChange(of: viewModel.searchText) { oldValue, newValue in
                // Search after each keystroke
                Task {
                    await viewModel.searchCharacters()
                }
            }
            .onAppear {
                // Only load default data on first launch
                if !hasLoadedInitialData {
                    hasLoadedInitialData = true
                    viewModel.searchText = "ri"
                    Task {
                        await viewModel.searchCharacters()
                    }
                }
            }
        }
    }
}


// MARK: - Character Row
struct CharacterRow: View {
    let character: Character
    
    var body: some View {
        HStack(spacing: 12) {
            // Character image
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            // Character info
            VStack(alignment: .leading, spacing: 4) {
                Text(character.name)
                    .font(.headline)
                
                Text(character.species)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
}
