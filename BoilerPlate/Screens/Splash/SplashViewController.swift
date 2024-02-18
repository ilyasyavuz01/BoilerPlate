//
//  SplashViewController.swift
//  BoilerPlate
//
//  Created by ilyas Y on 15.02.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SplashDisplayLogic: AnyObject {
    func display(viewModel: Splash.Something.ViewModel)
}

class SplashViewController: UIViewController, SplashDisplayLogic {
    var interactor: SplashBusinessLogic?
    var router: (NSObjectProtocol & SplashRoutingLogic)?

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = Splash.Something.Request()
        interactor?.handle(request: request)
    }

    // MARK: Requests

    func display(viewModel: Splash.Something.ViewModel) {
    
    }
}
