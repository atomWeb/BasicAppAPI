//
//  URLRequest.swift
//  BasicAppAPI
//
//  Created by Cristian Jose Perez Guerra on 03/04/2025.
//

import Foundation

enum HTTPMethod: String {

    case post = "POST"

    case get = "GET"

    case delete = "DELETE"

    case put = "PUT"
}

extension URLRequest {
    static func get(_ url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.timeoutInterval = 60
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
