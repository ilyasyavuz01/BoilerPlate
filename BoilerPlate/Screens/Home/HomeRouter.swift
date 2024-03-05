//
//  HomeRouter.swift
//  BoilerPlate
//
//  Created by ilyas Y on 5.03.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeRoutingLogic {
    func routeToSomeWhere()
}

class HomeRouter: NSObject, HomeRoutingLogic {
    weak var viewController: HomeViewController?

    // MARK: Routing Logic
    
    func routeToSomeWhere() {
        
    }
}
