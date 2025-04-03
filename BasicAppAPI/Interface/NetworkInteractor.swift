//
//  NetworkInteractor.swift
//  BasicAppAPI
//
//  Created by Cristian Jose Perez Guerra on 03/04/2025.
//

import Foundation

protocol NetworkInteractor {}

extension NetworkInteractor {
    func getJSON<JSON>(request: URLRequest, type: JSON.Type)
        async throws(NetworkError) -> JSON where JSON: Codable
    {
        let (data, response) = try await URLSession.shared.getData(for: request)
        if response.statusCode == 200 {
            do {
                let decoder = JSONDecoder()
                // decoder.dateDecodingStrategy = .formatted(.apiDateFormatter())
                return try decoder.decode(type, from: data)
            } catch {
                print(error)
                throw .json(error)
            }
        } else {
            throw .status(response.statusCode)
        }
    }
}

