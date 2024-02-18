//
//  Endpoint.swift
//  BoilerPlate
//
//  Created by ilyas Y on 11.02.2024.
//

import Foundation

class Endpoint: Remote.Endpoint {
    static let shared = Endpoint()
    
    private override init() {
        super.init()
        baseRequest.set(decoder: APIDecoder())
    }
}
