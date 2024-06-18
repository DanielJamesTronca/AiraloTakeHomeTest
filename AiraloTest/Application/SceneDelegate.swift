//
//  SceneDelegate.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    internal var window: UIWindow?
    
    private let dependencyInjectionContainer: DependencyInjectionContainer = DependencyInjectionContainer()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let mainAppFlowCoordinator: MainAppFlowCoordinator = MainAppFlowCoordinator(dependencyContainer: dependencyInjectionContainer)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = mainAppFlowCoordinator.navigationController
        window?.makeKeyAndVisible()
        // Start coordinator
        mainAppFlowCoordinator.start()
    }
}
