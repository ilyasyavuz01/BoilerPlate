//
//  DependencyFactory.swift
//  BoilerPlate
//
//  Created by ilyas Y on 15.02.2024.
//

import Foundation

protocol DependencyFactoryProtocol {
    var viewFactory: ViewControllerFactoryProtocol { get }
    
}

struct DependencyFactory: DependencyFactoryProtocol {
    var viewFactory: ViewControllerFactoryProtocol {
        ViewControllerFactory.shared
    }
    
}
