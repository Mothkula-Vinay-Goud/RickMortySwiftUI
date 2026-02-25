//
//  Constants.swift
//  RickMortySwiftUI
//
//  Created by Vinay Goud Mothkula on 2/24/26.
//

enum Server : String {
    case urlString = "https://rickandmortyapi.com/api/character/?name="
}
enum CharacterSearchResult {
    case success([Character])
    case empty(String)
    case failure(String)
}
