//
//  LocalEsimService.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation

struct LocalEsimService: ServiceProtocol {
    
    typealias ResponseModel = LocalEsim
    
    var url: URL? { URL(string: "https://www.airalo.com/api/v2/countries?type=popular") }
    
    var headersType: HeadersType = .json
    
    var parameters: [String : Any]? = nil
    
}
