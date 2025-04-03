//
//  TestRepository.swift
//  BasicAppAPI
//
//  Created by Cristian Jose Perez Guerra on 03/04/2025.
//

import Foundation

struct TestRepository: ApiDataRepository {
    func getCharacters(page: String) async throws(NetworkError)
        -> CharacterResponse
    {
        try getTestJSON(
            url: Bundle.main.url(
                forResource: "rickmortytest",
                withExtension: "json"
            )!,
            type: CharacterResponseDTO.self
        ).toModel
    }

    func getTestJSON<JSON>(url: URL, type: JSON.Type) throws(NetworkError)
        -> JSON where JSON: Decodable
    {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
        } catch {
            throw .general(error)
        }
    }
}
