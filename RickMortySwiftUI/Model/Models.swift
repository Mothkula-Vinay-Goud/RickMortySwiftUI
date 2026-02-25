//
//  Models.swift
//  RickMortySwiftUI
//
//  Created by Vinay Goud Mothkula on 2/24/26.
//

import Foundation

// MARK: - Character Response
// This is what we get back from the API
struct CharacterResponse: Codable {
    let info: Info
    let results: [Character]
}

// MARK: - Info
// Contains pagination information
struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

// MARK: - Character
// Represents a single Rick and Morty character
struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let origin: Origin
    let image: String
    let created: String
}

// MARK: - Origin
// Represents where the character is from
struct Origin: Codable {
    let name: String
}
