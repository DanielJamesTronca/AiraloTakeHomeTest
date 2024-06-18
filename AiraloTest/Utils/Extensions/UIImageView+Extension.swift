//
//  UIImageView+Extension.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import UIKit

extension UIImageView {
    func loadImage(at url: URL) {
        UIImageLoader.loader.load(url, for: self)
    }
    
    func cancelImageLoad() {
        UIImageLoader.loader.cancel(for: self)
    }
}
