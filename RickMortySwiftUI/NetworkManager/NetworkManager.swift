//
//  NetworkManager.swift
//  RickMortySwiftUI
//
//  Created by Vinay Goud Mothkula on 2/24/26.
//

import Foundation


class NetworkManager {
    
    func fetchCharacters(name: String) async -> CharacterSearchResult {
        
        let urlString = Server.urlString.rawValue + name
        
        guard let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encodedString) else {
            return .failure("Invalid URL")
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return .failure("Server error")
            }
            
            let decoded = try JSONDecoder().decode(CharacterResponse.self, from: data)
            
            if decoded.results.isEmpty {
                return .empty("No characters found")
            }
            
            return .success(decoded.results)
            
        } catch {
            return .failure(error.localizedDescription)
        }
    }
}
