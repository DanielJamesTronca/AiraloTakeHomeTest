//
//  EsimRepository.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation

protocol EsimRepository: AnyObject {
    func fetchLocalEsim() async throws -> LocalEsim
    func fetchCountryPackages(for esimId: String) async throws -> CountryPackages
}

