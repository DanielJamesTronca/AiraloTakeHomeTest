//
//  CountryPackagesService.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation

struct CountryPackagesService: ServiceProtocol {
    
    typealias ResponseModel = CountryPackages
    
    var countryId: String
    
    var url: URL? { URL(string: "https://www.airalo.com/api/v2/countries/\(countryId)") }
    
    var headersType: HeadersType = .json
    
    var parameters: [String : Any]? = nil
    
}
