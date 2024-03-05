//
//  NavigationFlowController.swift
//  BoilerPlate
//
//  Created by ilyas Y on 15.02.2024.
//

import UIKit

class NavigationFlowController: FlowController, UINavigationControllerDelegate {
    let navigation = UINavigationController()
    
    override init(dependency: DependencyFactoryProtocol) {
        super.init(dependency: dependency)
        add(child: navigation)
        navigation.navigationBar.isHidden = true
        navigation.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func back(animated: Bool) {
        back(by: 1, animated: animated)
    }
    
    override func back(by index: Int, animated: Bool) {
        let count = navigation.viewControllers.count
        
        for i in (count - index) ..< (count - 1) {
            let viewController = navigation.viewControllers.remove(at: i)
            viewController.removeFromParent()
        }
        
        if navigation.popViewController(animated: animated) == nil {
            super.back(by: index, animated: animated)
        }
    }
    
    func push(viewController: UIViewController, animated: Bool) {
        // Pop previous views with same class
        if let previous = navigation.viewControllers.first(where: { controller in type(of: controller) == type(of: viewController)}) {
            navigation.popToViewController(previous, animated: animated)
        } else {
            // Connect Flows navigation gesture to each other.
            if let flowing = viewController as? NavigationFlowController {
                navigation.interactivePopGestureRecognizer?.delegate = flowing.navigation.interactivePopGestureRecognizer?.delegate
            }
            navigation.pushViewController(
                viewController,
                animated: animated
            )
        }
    }

    func pushEndless(viewController: UIViewController, animated: Bool) {
        // Connect Flows navigation gesture to each other.
        if let flowing = viewController as? NavigationFlowController {
            navigation.interactivePopGestureRecognizer?.delegate = flowing.navigation.interactivePopGestureRecognizer?.delegate
        }
        navigation.pushViewController(
            viewController,
            animated: animated
        )
    }
    
    func pushWithoutPop(viewController: UIViewController, animated: Bool) {
        // Remove previous views with same class
        navigation.viewControllers = navigation.viewControllers.filter { controller in
            type(of: controller) != type(of: viewController)
        }
        // Connect Flows navigation gesture to each other.
        if let flowing = viewController as? NavigationFlowController {
            navigation.interactivePopGestureRecognizer?.delegate = flowing.navigation.interactivePopGestureRecognizer?.delegate
        }
        navigation.pushViewController(
            viewController,
            animated: animated
        )
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        checkChildsForInteractiveGestureDelegate(willShow: viewController)
    }
    
    private func checkChildsForInteractiveGestureDelegate(willShow viewController: UIViewController) {
        if let nav = self.parent as? UINavigationController,
           let parent = nav.parent as? NavigationFlowController,
           self.navigation.viewControllers.count == 1 {
            parent.navigation.interactivePopGestureRecognizer?.delegate = nav.interactivePopGestureRecognizer?.delegate
        } else {
            if let nav = viewController as? NavigationFlowController {
                if nav.navigation.viewControllers.count == 1, self.navigation.viewControllers.contains(viewController) {
                    self.navigation.interactivePopGestureRecognizer?.delegate = nav.navigation.interactivePopGestureRecognizer?.delegate
                }
            }
        }
    }
}
