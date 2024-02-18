//
//  ViewControllerFactory.swift
//  BoilerPlate
//
//  Created by ilyas Y on 15.02.2024.
//

import UIKit

protocol ViewControllerFactoryProtocol {
    func makeSplash(dependency: DependencyFactoryProtocol) -> UIViewController
}

struct ViewControllerFactory: ViewControllerFactoryProtocol {
    static let shared = ViewControllerFactory()
    
    private init() { }
    
    func makeSplash(dependency: DependencyFactoryProtocol) -> UIViewController {
        let viewController = SplashViewController(nibName: "SplashView", bundle: nil)
        let interactor = SplashInteractor()
        let presenter = SplashPresenter()
        let router = SplashRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
