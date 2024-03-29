//
//  SplashRouter.swift
//  BoilerPlate
//
//  Created by ilyas Y on 15.02.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SplashRoutingLogic {
    func routeToHome()
}

class SplashRouter: NSObject, SplashRoutingLogic {
    weak var viewController: SplashViewController?

    // MARK: Routing Logic
    
    func routeToHome() {
        let flow: AppFlowProtocol? = viewController?.flow()
        flow?.route(to: .home, animated: true)
    }
}
