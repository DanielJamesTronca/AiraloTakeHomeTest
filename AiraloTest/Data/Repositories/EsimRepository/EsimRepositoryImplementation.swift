//
//  EsimRepositoryImplementation.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation

final class EsimRepositoryImplementation: EsimRepository {
    
    private let networkManager: NetworkManager = NetworkManager.shared
    
    func fetchLocalEsim() async throws -> LocalEsim {
        try await networkManager.get(service: LocalEsimService())
    }
    
    func fetchCountryPackages(for esimId: String) async throws -> CountryPackages {
        try await networkManager.get(service: CountryPackagesService(countryId: esimId))
    }
}
