//
//  URL.swift
//  BasicAppAPI
//
//  Created by Cristian Jose Perez Guerra on 03/04/2025.
//

import Foundation

let apiURL = URL(string: "https://rickandmortyapi.com/api/character")!

extension URL {
    static func getCharacters(page: String) -> URL {
        apiURL
            .appending(queryItems: [.pageQuery(page: page)])
    }
}

extension URLQueryItem {
    static func pageQuery(page: String) -> URLQueryItem {
        URLQueryItem(name: "page", value: page)
    }
}
