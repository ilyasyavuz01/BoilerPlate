//
//  HomeInteractor.swift
//  BoilerPlate
//
//  Created by ilyas Y on 5.03.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeBusinessLogic {
    func handle(request: Home.Something.Request)
}

class HomeInteractor: HomeBusinessLogic {
    var presenter: HomePresentationLogic?
    
    // MARK: Business Logic

    func handle(request: Home.Something.Request) {
        let response = Home.Something.Response()
        presenter?.present(response: response)
    }
}
