//
//  FlowController.swift
//  BoilerPlate
//
//  Created by ilyas Y on 15.02.2024.
//

import UIKit

protocol FlowControllerProtocol: UIViewController {
    var dependency: DependencyFactoryProtocol { get }
    func back(animated: Bool)
    func back(by index: Int, animated: Bool)
}

class FlowController: UIViewController, FlowControllerProtocol {
    let dependency: DependencyFactoryProtocol
    
    init(dependency: DependencyFactoryProtocol) {
        self.dependency = dependency
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        children.first?.view.frame = view.bounds
    }
    
    func add(child: UIViewController) {
        child.willMove(toParent: self)
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func back(animated: Bool) {
        back(by: 1, animated: animated)
    }
    
    func back(by index: Int, animated: Bool) {
        guard let navigationController = navigationController else { return }
        
        let count = navigationController.viewControllers.count
        
        for i in (count - index) ..< (count - 1) {
            let viewController = navigationController.viewControllers.remove(at: i)
            viewController.removeFromParent()
        }

        navigationController.popViewController(animated: animated)
    }
}

extension UIViewController {
    func flow<T>() -> T? {
        var viewController: UIViewController? = self
        
        while viewController != nil {
            if viewController is T {
                return viewController as? T
            }
            if viewController?.parent != nil {
                viewController = viewController?.parent
            } else if viewController?.presentingViewController != nil {
                viewController = viewController?.presentingViewController
            } else {
               viewController = nil
            }
        }
        
        return nil
    }
}
