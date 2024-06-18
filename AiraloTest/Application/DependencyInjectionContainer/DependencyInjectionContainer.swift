//
//  DependencyInjectionContainer.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import UIKit

/// The `DependencyInjectionContainer` class is responsible for creating and providing the dependencies required
/// by various view controllers in the application. It helps in managing the dependencies in a centralized manner.
final class DependencyInjectionContainer {
    
    internal func makeEsimViewController(actions: LocalEsimActions) -> UIViewController {
        LocalEsimViewController(viewModel: LocalEsimViewModel(localEsimActions: actions))
    }
    
    internal func makeCountryPackagesViewController(actions: CountryPackagesActions) -> UIViewController {
        CountryPackagesViewController(viewModel: CountryPackagesViewModel(localEsimActions: actions))
    }
}
