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
    var state: APIState<[Character]> = .loading
    
    private let networkManager = NetworkManager()
    
    func searchCharacters() async {
        
        guard !searchText.isEmpty else {
            characters = []
            return
        }
        
        state = .loading
        
        let result: APIState<CharacterResponse> =
            await networkManager.execute(Server.characters(name: searchText.lowercased()).url)
        
        switch result {
            
        case .complete(let response):
            if response.results.isEmpty {
                state = .empty
                characters = []
            } else {
                characters = response.results
                state = .complete(response.results)
            }
            
        case .empty:
            characters = []
            state = .empty
            
        case .failed(let error):
            characters = []
            state = .failed(error)
            
        case .loading:
            break
        }
    }
}
