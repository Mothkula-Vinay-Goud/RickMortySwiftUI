//
//  CharacterDetailView.swift
//  RickMortySwiftUI
//
//  Created by Vinay Goud Mothkula on 2/24/26.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Full width image
                AsyncImage(url: URL(string: character.image)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text("Species")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(character.species)
                        .font(.body)
                    
                    Text("Status")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(character.status)
                        .font(.body)
                    
                    Text("Origin")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(character.origin.name)
                        .font(.body)
                    
                    if !character.type.isEmpty {
                        Text("Type")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(character.type)
                            .font(.body)
                    }
                    
                    Text("Created")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(character.created)
                        .font(.body)
                }
                .padding()
            }
        }
        .navigationTitle(character.name)
    }
}
