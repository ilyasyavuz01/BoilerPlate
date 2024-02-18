//
//  SplashInteractor.swift
//  BoilerPlate
//
//  Created by ilyas Y on 15.02.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SplashBusinessLogic {
    func handle(request: Splash.Something.Request)
}

class SplashInteractor: SplashBusinessLogic {
    var presenter: SplashPresentationLogic?
    
    // MARK: Business Logic

    func handle(request: Splash.Something.Request) {
        let response = Splash.Something.Response()
        presenter?.present(response: response)
    }
}
