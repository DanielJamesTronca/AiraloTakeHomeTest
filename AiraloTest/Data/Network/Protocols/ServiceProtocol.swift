//
//  ServiceProtocol.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation

protocol ServiceProtocol {
    
    associatedtype ResponseModel: Decodable
    
    var url: URL? { get }
    
    var headersType: HeadersType { get }
    
    var parameters: [String: Any]? { get }
    
}
