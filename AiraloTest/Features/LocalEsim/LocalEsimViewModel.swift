//
//  LocalEsimViewModel.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation
import Combine

struct LocalEsimActions {
    let didTapCountry: ((_ packages: CountryPackages)->Void)
}

final class LocalEsimViewModel {
    
    deinit { print("\(type(of: self)) is being deallocated") }

    private let localEsimActions: LocalEsimActions
    private let fetchLocalEsimUseCase: any FetchLocalEsimUseCase
    private let fetchCountryPacakgesUseCase: any FetchCountryPackagesUseCase
    
    /// Set to store Combine cancellables.
    internal var cancellables = Set<AnyCancellable>()
    /// Published property to track the current state of articles loading.
    @Published private(set) var state: State = State.idle
    /// Data source for articles to be displayed.
    private(set) var dataSource: LocalEsim = []
    
    init(
        localEsimActions: LocalEsimActions,
        fetchLocalEsimUseCase: any FetchLocalEsimUseCase,
        fetchCountryPacakgesUseCase: any FetchCountryPackagesUseCase
    ) {
        self.localEsimActions = localEsimActions
        self.fetchLocalEsimUseCase = fetchLocalEsimUseCase
        self.fetchCountryPacakgesUseCase = fetchCountryPacakgesUseCase
        initData()
    }
    
    internal func initData() {
        Task { @MainActor [weak self] in
            guard let self else { return }
            state = .loading
            do {
                dataSource = try await fetchLocalEsimUseCase.execute()
                state = .loaded
            } catch {
                state = .failed(error)
            }
        }
    }
}
