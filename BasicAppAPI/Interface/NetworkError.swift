//
//  ErrorHandler.swift
//  BasicAppAPI
//
//  Created by Cristian Jose Perez Guerra on 03/04/2025.
//

import Foundation

enum NetworkError: LocalizedError {

    case general(Error)

    case status(Int)

    case json(Error)

    case nonHTTP

    var errorDescription: String? {
        switch self {
        case .general(let error):
            "General error: \(error.localizedDescription)."
        case .status(let int):
            "Status error: \(int)."
        case .json(let error):
            "JSON Decoding error: \(error)"
        case .nonHTTP:
            "The response was not a HTTP response."
        }
    }
}
