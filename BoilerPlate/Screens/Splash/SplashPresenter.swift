//
//  SplashPresenter.swift
//  BoilerPlate
//
//  Created by ilyas Y on 15.02.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SplashPresentationLogic {
    func present(response: Splash.Something.Response)
}

class SplashPresenter: SplashPresentationLogic {
    weak var viewController: SplashDisplayLogic?

    // MARK: Presentation Logic
    
    func present(response: Splash.Something.Response) {
        let viewModel = Splash.Something.ViewModel()
        viewController?.display(viewModel: viewModel)
    }
}
