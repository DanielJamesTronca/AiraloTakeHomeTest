//
//  CountryPackagesViewModel.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation
import SwiftUI

final class CountryPackagesViewModel: ObservableObject {
    
    private let localEsim: LocalEsimElement
    private let fetchCountryPacakgesUseCase: any FetchCountryPackagesUseCase

    /// Published property to track the current state of articles loading.
    @Published private(set) var state: State = State.idle
    
    @Published private(set) var countryPackages: CountryPackages?

    init(
        localEsim: LocalEsimElement,
        fetchCountryPacakgesUseCase: any FetchCountryPackagesUseCase
    ) {
        self.localEsim = localEsim
        self.fetchCountryPacakgesUseCase = fetchCountryPacakgesUseCase
        initData()
    }
    
    private func initData() {
        Task { @MainActor [weak self] in
            guard let self else { return }
            state = .loading
            do {
                countryPackages = try await fetchCountryPacakgesUseCase.execute(esimId: "\(localEsim.id)")
                print(countryPackages)
                state = .loaded
            } catch {
                state = .failed(error)
            }
        }
    }
}
