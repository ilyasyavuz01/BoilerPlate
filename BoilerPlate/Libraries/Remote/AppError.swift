//
//  AppError.swift
//  BoilerPlate
//
//  Created by ilyas Y on 7.01.2024.
//

import Foundation

enum AppError: LocalizedError {
    case remote(error: ErrorEntity)
    case array(errors: [ErrorEntity])
    case custom(String)
    case login
    
    var errorDescription: String? {
        switch self {
        case let .remote(error):
            return error.message ?? error.code ?? "Unknown error"
        case let .array(errors):
            return errors.first?.message ?? errors.first?.code ?? "Unknown error"
        case let .custom(message):
            return message
        case .login:
            return "You should log in to perform this operation."
        }
    }
}
