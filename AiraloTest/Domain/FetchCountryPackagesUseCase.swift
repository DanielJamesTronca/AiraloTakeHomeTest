//
//  FetchCountryPackagesUseCase.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation

protocol FetchCountryPackagesUseCase: AnyObject {
    func execute(esimId: String) async throws -> CountryPackages
}

final class FetchCountryPackagesUseCaseImplementation: FetchCountryPackagesUseCase {
    
    private let esimRepository: any EsimRepository
    
    init(esimRepository: any EsimRepository) {
        self.esimRepository = esimRepository
    }
    
    func execute(esimId: String) async throws -> CountryPackages {
        try await esimRepository.fetchCountryPackages(for: esimId)
    }
}
