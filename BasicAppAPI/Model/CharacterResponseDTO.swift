//
//  CharacterDTO.swift
//  BasicAppAPI
//
//  Created by Cristian Jose Perez Guerra on 1/4/25.
//

import Foundation

struct CharacterResponseDTO: Codable {
    let info: InfoDTO
    let results: [CharacterDTO]
    
    var toModel: CharacterResponse {
        CharacterResponse(
            info: info.toModel,
            results: results.map(\.toModel) // La forma mas correcta
            // results: results.map { $0.toModel } // No esta mal
        )
    }
}

struct InfoDTO: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    
    var toModel: Info {
        Info(
            count: count,
            pages: pages,
            nextPageUrl: next != nil ? URL(string: next!) : nil,
            previousPageUrl: prev != nil ? URL(string: prev!) : nil
        )
    }
}

struct CharacterDTO: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: OriginDTO
    let location: LocationDTO
    let image: String
    let url: String
    let created: String
    
    var toModel: CharacterModel {
        let dateFormatter = ISO8601DateFormatter()
        return CharacterModel(
            id: id,
            name: name,
            status: Status(rawValue: status) ?? .unknown,
            species: species,
            type: type.isEmpty ? nil : type,
            gender: Gender(rawValue: gender) ?? .unknown,
            origin: origin.toModel,
            location: location.toModel,
            imageUrl: URL(string: image)!,
            detailUrl: URL(string: url)!,
            createdDate: dateFormatter.date(from: created) ?? Date()
        )
    }
}

struct OriginDTO: Codable {
    let name: String
    
    var toModel: Origin {
        Origin(name: name)
    }
}

struct LocationDTO: Codable {
    let name: String
    let url: String
    
    var toModel: Location {
        Location(
            name: name,
            url: URL(string: url)
        )
    }
}
