//
//  Navigator.swift
//  BoilerPlate
//
//  Created by ilyas Y on 15.02.2024.
//

import UIKit

protocol NavigatorProtocol {
    func to(_ destination: Navigator.Destination, animated: Bool)
}

class Navigator: NavigatorProtocol {
    enum Destination {
        case splash   
        case home
    }
    
    static let shared = Navigator()
    private init() { }
    
    var flow: AppFlowProtocol?
    
    func to(_ destination: Navigator.Destination, animated: Bool) {
        flow?.route(to: destination, animated: animated)
    }
}
