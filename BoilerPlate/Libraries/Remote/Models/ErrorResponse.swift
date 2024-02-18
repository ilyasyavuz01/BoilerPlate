//
//  ErrorResponse.swift
//  BoilerPlate
//
//  Created by ilyas Y on 7.01.2024.
//

import Foundation

struct ErrorResponse: Decodable {
    let success: Bool?
    let error: [ErrorEntity]?
}
