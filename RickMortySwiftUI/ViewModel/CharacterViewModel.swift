//
//  CharacterViewModel.swift
//  RickMortySwiftUI
//
//  Created by Vinay Goud Mothkula on 2/24/26.
//

import Foundation

@Observable
class CharacterViewModel {
    
    var characters: [Character] = []
    var searchText: String = ""
    var isLoading: Bool = false
    var errorMessage: String?
    
    // Create an instance of NetworkManager
    private let networkManager = NetworkManager()
    
    // This function handles the search logic
    func searchCharacters() async {
        
        guard !searchText.isEmpty else {
            characters = []
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        let result = await networkManager.fetchCharacters(name: searchText.lowercased())
        
        switch result {
            
        case .success(let characters):
            self.characters = characters
            
        case .empty(let message):
            self.characters = []
            self.errorMessage = message
            
        case .failure(let message):
            self.characters = []
            self.errorMessage = message
        }
        
        isLoading = false
    }
}
