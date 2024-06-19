//
//  String+Extension.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 19/06/24.
//

import Foundation

extension String {
    
    var localized: String { NSLocalizedString(self, comment: "\(self)_comment") }
    
    func localized(with arguments: CVarArg...) -> String {
        String(format: localized, arguments)
    }
}
