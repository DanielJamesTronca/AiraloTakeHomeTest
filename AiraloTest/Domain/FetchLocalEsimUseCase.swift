//
//  FetchLocalEsimUseCase.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation

protocol FetchLocalEsimUseCase: AnyObject {
    func execute() async throws -> LocalEsim
}

final class FetchLocalEsimUseCaseImplementation: FetchLocalEsimUseCase {
    
    private let esimRepository: any EsimRepository
    
    init(esimRepository: any EsimRepository) {
        self.esimRepository = esimRepository
    }
    
    func execute() async throws -> LocalEsim {
        try await esimRepository.fetchLocalEsim()
    }
}
