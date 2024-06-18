//
//  State.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation

enum State {
    case idle
    case loading
    case failed(_ error: Error)
    case loaded
}
