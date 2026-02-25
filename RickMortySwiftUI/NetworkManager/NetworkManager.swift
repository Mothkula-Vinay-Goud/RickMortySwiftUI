//
//  NetworkManager.swift
//  RickMortySwiftUI
//
//  Created by Vinay Goud Mothkula on 2/24/26.
//

    import Foundation


class NetworkManager {
    
    func execute<T: Decodable>(_ urlString: String) async -> APIState<T> {
        
        guard let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encoded) else {
            return .failed(URLError(.badURL))
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return .failed(URLError(.badServerResponse))
            }
            
            if data.isEmpty {
                return .empty
            }
            
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return .complete(decoded)
            
        } catch {
            return .failed(error)
        }
    }
}
