//
//  AppDelegate.swift
//  BoilerPlate
//
//  Created by ilyas Y on 2.02.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var flow: FlowControllerProtocol
    
    override convenience init() {
        self.init(flow: AppFlow(dependency: DependencyFactory()))
    }
    
    init(flow: FlowControllerProtocol) {
        self.flow = flow
        Navigator.shared.flow = flow as? AppFlowProtocol
        super.init()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = flow
        window?.makeKeyAndVisible()

        return true
    }
}
