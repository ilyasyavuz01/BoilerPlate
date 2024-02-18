//
//  Remote.swift
//  BoilerPlate
//
//  Created by ilyas Y on 7.01.2024.
//

import Foundation

struct Remote {
    enum Error: LocalizedError {
        case nilResponse
        case noContent
        case decode(data: Data, underlyingError: Swift.Error)
        case service(exception: [ErrorEntity])
        case response(code: Int)

        public var errorDescription: String? {
            switch self {
            case .decode(_, let underlyingError):
                return underlyingError.localizedDescription
            case .service(let exception):
                return exception.first?.message
            case .response, .nilResponse, .noContent:
                return NSLocalizedString("Failed to retrieve content", comment: "Nil response received")
            }
        }
    }
}
