//
//  URLSession.swift
//  BasicAppAPI
//
//  Created by Cristian Jose Perez Guerra on 03/04/2025.
//

import Foundation

extension URLSession {
    
    func getData(for request: URLRequest) async throws(NetworkError) -> (data: Data, response: HTTPURLResponse) {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.nonHTTP
            }
            return (data, response)
        } catch let error as NetworkError {
            throw error
        } catch {
            throw .general(error)
        }
    }
}
