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
            didTapCountry: { [weak self] packages in
                self?.showCountryPackages(with: packages)
            }
        )
        let viewController = dependencyContainer.makeEsimViewController(actions: actions)
        navigationController.viewControllers = [viewController]
    }
    
    private func showCountryPackages(with packages: CountryPackages) {
        
    }
}
