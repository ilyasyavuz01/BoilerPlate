//
//  APIDecoder.swift
//  BoilerPlate
//
//  Created by ilyas Y on 7.01.2024.
//

import Foundation

struct APIDecoder: RemoteDecoderProtocol {
    func decode<T>(data: Data, urlResponse: URLResponse) throws -> T where T: Decodable {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
            let container = try decoder.singleValueContainer()
            let interval = try container.decode(TimeInterval.self) / 1_000.0
            
            return Date(timeIntervalSince1970: interval)
        })
        
        if
            let response = try? decoder.decode(ErrorResponse.self, from: data),
            response.error != nil
        {
            var errors: [ErrorEntity] = []
            for error in response.error ?? [] {
                errors.append(ErrorEntity(code: error.code, message: error.message))
            }
            throw AppError.array(errors: errors)
        }

        return try decoder.decode(T.self, from: data)
    }
}
