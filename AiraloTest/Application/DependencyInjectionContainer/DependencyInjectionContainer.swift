//
//  DependencyInjectionContainer.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import UIKit
import SwiftUI

/// The `DependencyInjectionContainer` class is responsible for creating and providing the dependencies required
/// by various view controllers in the application. It helps in managing the dependencies in a centralized manner.
final class DependencyInjectionContainer {
    
    /// Creates and returns a `LocalEsimViewController` with its dependencies.
    /// - Parameter actions: The actions that can be performed in the `LocalEsimViewController`.
    /// - Returns: A configured `LocalEsimViewController` instance.
    internal func makeEsimViewController(actions: LocalEsimActions) -> UIViewController {
        LocalEsimViewController(
            viewModel: LocalEsimViewModel(
                actions: actions,
                fetchLocalEsimUseCase: makeFetchLocalEsimUseCase()
            )
        )
    }
    
    /// Creates and returns a `CountryPackagesViewController` with its dependencies.
    /// - Parameter localEsim: The local eSIM element.
    /// - Returns: A configured `CountryPackagesViewController` instance.
    internal func makeCountryPackagesViewController(localEsim: LocalEsimElement) -> UIViewController {
        UIHostingController(
            rootView: CountryPackagesView(
                viewModel: CountryPackagesViewModel(
                    localEsim: localEsim,
                    fetchCountryPacakgesUseCase: makeFetchCountryPackagesUseCase()
                )
            )
        )
    }
}

//
// MARK: - Use Cases -
//

private extension DependencyInjectionContainer {
    /// Creates and returns a `FetchLocalEsimUseCase` instance with its dependencies.
    /// - Returns: A configured `FetchLocalEsimUseCase` instance.
    private func makeFetchLocalEsimUseCase() -> any FetchLocalEsimUseCase {
        FetchLocalEsimUseCaseImplementation(esimRepository: makeEsimRepository())
    }
    /// Creates and returns a `FetchCountryPackagesUseCase` instance with its dependencies.
    /// - Returns: A configured `FetchCountryPackagesUseCase` instance.
    private func makeFetchCountryPackagesUseCase() -> any FetchCountryPackagesUseCase {
        FetchCountryPackagesUseCaseImplementation(esimRepository: makeEsimRepository())
    }
}

//
// MARK: - Repositories -
//

private extension DependencyInjectionContainer {
    /// Creates and returns an `EsimRepository` instance.
    /// - Returns: A configured `EsimRepository` instance.
    private func makeEsimRepository() -> any EsimRepository { EsimRepositoryImplementation() }
}
