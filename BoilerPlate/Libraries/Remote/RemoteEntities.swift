//
//  RemoteEntities.swift
//  BoilerPlate
//
//  Created by ilyas Y on 7.01.2024.
//

import Foundation

extension Remote {
    enum HttpMethod: String {
        case get
        case post
        case put
        case delete
    }
    
    enum ContentType: String {
        case json = "application/json"
        case urlEncoded = "application/x-www-form-urlencoded"
        case multiPartFormData = "multipart/form-data"
    }
    
    enum HttpHeader {
        case contentType(ContentType, String?)
        case authorization(Authorization)
        case channel
        case deviceId(String)
        
        enum Authorization {
            case none(String)
            case bearer(String)
        }

        func pair() -> (key: String, value: String) {
            switch self {
            case .contentType(let value, let boundary):
                if let boundary = boundary {
                    return (key: "content-type", value: "\(value.rawValue); boundary=\(boundary)")
                } else {
                    return (key: "content-type", value: value.rawValue)
                }
                
            case .authorization(let authorization):
                switch authorization {
                case .none(let token):
                    return (key: "authorization", value: token)
                case .bearer(let token):
                    return (key: "authorization", value: "Bearer \(token)")
                }
            case .channel:
                return (key: "channel-type", value: "IOS")
            case .deviceId(let uuid):
                return (key: "X-Device-Id", value: uuid)
            }
        }
    }
}

extension Remote.HttpHeader: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(pair().key)
    }
    
    static func == (lhs: Remote.HttpHeader, rhs: Remote.HttpHeader) -> Bool {
        lhs.hashValue == rhs.hashValue
    }    
}
