//
//  CharacterModels.swift
//  BasicAppAPI
//
//  Created by Cristian Jose Perez Guerra on 1/4/25.
//

import Foundation

struct CharacterResponse {
    let info: Info
    let results: [CharacterModel]
}

struct Info {
    let count: Int
    let pages: Int
    let nextPageUrl: URL?
    let previousPageUrl: URL?
}

struct CharacterModel: Identifiable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String?
    let gender: Gender
    let origin: Origin
    let location: Location
    let imageUrl: URL
    let detailUrl: URL
    let createdDate: Date
    
    var createdDateStr: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return createdDate.formatted(date: .abbreviated, time: .omitted)
    }
}

struct Origin {
    let name: String
}

struct Location {
    let name: String
    let url: URL?
}

enum Status: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

enum Gender: String {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}
