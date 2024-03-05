//
//  SplashInteractor.swift
//  BoilerPlate
//
//  Created by ilyas Y on 15.02.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SplashBusinessLogic {
    func handle(request: Splash.RouteToHome.Request)
}

class SplashInteractor: SplashBusinessLogic {
    var presenter: SplashPresentationLogic?
    
    // MARK: Business Logic

    func handle(request: Splash.RouteToHome.Request) {
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.presenter?.present(response: Splash.RouteToHome.Response())
        }

    }
}
