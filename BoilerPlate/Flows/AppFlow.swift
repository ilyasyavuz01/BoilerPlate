//
//  AppFlow.swift
//  BoilerPlate
//
//  Created by ilyas Y on 15.02.2024.
//

import UIKit

protocol AppFlowProtocol: FlowControllerProtocol {
    func route(to destination: Navigator.Destination, animated: Bool)
}

class AppFlow: NavigationFlowController, AppFlowProtocol {
    override init(dependency: DependencyFactoryProtocol) {
        super.init(dependency: dependency)
        route(to: .splash, animated: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func route(to destination: Navigator.Destination, animated: Bool) {
        switch destination {
        case .splash:
            push(viewController: dependency.viewFactory.makeSplash(dependency: dependency), animated: animated)
        case .home:
            push(viewController: dependency.viewFactory.makeHome(), animated: animated)
        }
    }

}
