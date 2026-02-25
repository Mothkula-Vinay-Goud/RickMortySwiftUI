//
//  Constants.swift
//  RickMortySwiftUI
//
//  Created by Vinay Goud Mothkula on 2/24/26.
//

enum Server {
    case characters(name: String)
    
    var url: String {
        switch self {
        case .characters(let name):
            return "https://rickandmortyapi.com/api/character/?name=\(name)"
        }
    }
}
enum APIState<T> {
    case loading
    case empty
    case failed(Error)
    case complete(T)
}
