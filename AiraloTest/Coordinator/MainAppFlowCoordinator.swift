//
//  MainAppFlowCoordinator.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import UIKit

final class MainAppFlowCoordinator: Coordinator {
    
    internal var navigationController: UINavigationController
    private let dependencyContainer: DependencyInjectionContainer
    
    internal init(
        navigationController: UINavigationController = UINavigationController(),
        dependencyContainer: DependencyInjectionContainer
    ) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
        self.dependencyContainer = dependencyContainer
    }
    
    func start() {
        let actions: LocalEsimActions = LocalEsimActions(
            didTapCountry: { [weak self] localEsim in
                self?.showCountryPackages(with: localEsim)
            }
        )
        let viewController = dependencyContainer.makeEsimViewController(actions: actions)
        navigationController.viewControllers = [viewController]
    }
    
    private func showCountryPackages(with localEsim: LocalEsimElement) {
        let viewController = dependencyContainer.makeCountryPackagesViewController(localEsim: localEsim)
        viewController.title = localEsim.title
        navigationController.pushViewController(viewController, animated: true)
    }
}
