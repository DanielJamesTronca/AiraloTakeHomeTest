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
    
    internal func makeEsimViewController(actions: LocalEsimActions) -> UIViewController {
        LocalEsimViewController(
            viewModel: LocalEsimViewModel(
                actions: actions,
                fetchLocalEsimUseCase: makeFetchLocalEsimUseCase()
            )
        )
    }
    
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
    private func makeFetchLocalEsimUseCase() -> any FetchLocalEsimUseCase {
        FetchLocalEsimUseCaseImplementation(esimRepository: makeEsimRepository())
    }
    
    private func makeFetchCountryPackagesUseCase() -> any FetchCountryPackagesUseCase {
        FetchCountryPackagesUseCaseImplementation(esimRepository: makeEsimRepository())
    }
}

//
// MARK: - Repositories -
//

private extension DependencyInjectionContainer {
    private func makeEsimRepository() -> any EsimRepository { EsimRepositoryImplementation() }
}
