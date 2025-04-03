//
//  NetworkRepository.swift
//  BasicAppAPI
//
//  Created by Cristian Jose Perez Guerra on 03/04/2025.
//

import Foundation

protocol ApiDataRepository: Sendable {
    func getCharacters(page: String) async throws(NetworkError) -> CharacterResponse
}

struct NetworkRepository: ApiDataRepository, NetworkInteractor {
    func getCharacters(page: String) async throws(NetworkError) -> CharacterResponse {
        try await getJSON(request: .get(.getCharacters(page: page)), type: CharacterResponseDTO.self).toModel
    }
}
