//
//  RemoteDecoder.swift
//  BoilerPlate
//
//  Created by ilyas Y on 7.01.2024.
//

import Foundation

protocol RemoteDecoderProtocol {
    func decode<T: Decodable>(data: Data, urlResponse: URLResponse) throws -> T
}

extension Remote {
    struct Decoder {
        struct Json: RemoteDecoderProtocol {
            func decode<T: Decodable>(data: Data, urlResponse: URLResponse) throws -> T {
                let decoder = JSONDecoder()
                return try decoder.decode(T.self, from: data)
            }
        }
    }
}
