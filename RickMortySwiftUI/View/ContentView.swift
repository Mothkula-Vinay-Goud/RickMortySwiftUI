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
                
                switch viewModel.state {
                    
                case .loading:
                    ProgressView("Loading...")
                    
                case .empty:
                    Text("No Characters Found")
                        .foregroundColor(.gray)
                    
                case .failed:
                    VStack {
                        Text("Something went wrong")
                        
                        Button("Try Again") {
                            Task {
                                await viewModel.searchCharacters()
                            }
                        }
                    }
                    
                case .complete:
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
            .searchable(text: $viewModel.searchText)
            .onChange(of: viewModel.searchText) { _, _ in
                Task {
                    await viewModel.searchCharacters()
                }
            }
            .onAppear {
                viewModel.searchText = "rick"
                Task {
                    await viewModel.searchCharacters()
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
