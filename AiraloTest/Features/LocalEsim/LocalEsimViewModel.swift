//
//  LocalEsimViewModel.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation
import Combine

struct LocalEsimActions {
    let didTapCountry: ((_ localEsim: LocalEsimElement)->Void)
}

final class LocalEsimViewModel {
    
    deinit { print("\(type(of: self)) is being deallocated") }

    private let actions: LocalEsimActions
    private let fetchLocalEsimUseCase: any FetchLocalEsimUseCase
    
    /// Set to store Combine cancellables.
    internal var cancellables = Set<AnyCancellable>()
    /// Published property to track the current state of articles loading.
    @Published private(set) var state: State = State.idle
    /// Data source for articles to be displayed.
    private(set) var dataSource: [EsimDataSource] = []
    
    init(
        actions: LocalEsimActions,
        fetchLocalEsimUseCase: any FetchLocalEsimUseCase
    ) {
        self.actions = actions
        self.fetchLocalEsimUseCase = fetchLocalEsimUseCase
        initData()
    }
    
    internal func initData() {
        Task { @MainActor [weak self] in
            guard let self else { return }
            state = .loading
            do {
                let localEsim: LocalEsim = try await fetchLocalEsimUseCase.execute()
                dataSource = [
                    EsimDataSource(header: App.Localization.popularCountries, esim: localEsim)
                ]
                state = .loaded
            } catch {
                state = .failed(error)
            }
        }
    }
    
    internal func didTapLocalEsim(esim: LocalEsimElement) {
        actions.didTapCountry(esim)
    }
}
