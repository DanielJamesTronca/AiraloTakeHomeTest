//
//  NetworkError.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed(reason: String)
    case decodingFailed
    case unknown
}
