//
//  CountryPackagesViewModel.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation
import SwiftUI

final class CountryPackagesViewModel: ObservableObject {
    
    deinit { print("\(type(of: self)) is being deallocated") }

    private let localEsim: LocalEsimElement
    private let fetchCountryPacakgesUseCase: any FetchCountryPackagesUseCase

    /// Published property to track the current state of local esim loading.
    @Published private(set) var state: State = State.idle
    /// Data source for countrypackages to be displayed.
    @Published private(set) var countryPackages: CountryPackages?

    init(
        localEsim: LocalEsimElement,
        fetchCountryPacakgesUseCase: any FetchCountryPackagesUseCase
    ) {
        self.localEsim = localEsim
        self.fetchCountryPacakgesUseCase = fetchCountryPacakgesUseCase
        initData()
    }
    
    /// Initializes the data by fetching country packages.
    private func initData() {
        Task { @MainActor [weak self] in
            guard let self else { return }
            state = .loading
            do {
                countryPackages = try await fetchCountryPacakgesUseCase.execute(esimId: String(localEsim.id))
                state = .loaded
            } catch {
                state = .failed(error)
            }
        }
    }
}
