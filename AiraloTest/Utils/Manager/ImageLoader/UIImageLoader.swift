//
//  UIImageLoader.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import UIKit

final class UIImageLoader {
    
    static let loader = UIImageLoader()
    
    private let imageLoader = ImageLoader()
    private var uuidMap = [UIImageView: UUID]()
    
    private init() { }
    
    internal func load(_ url: URL, for imageView: UIImageView) {
        let token = imageLoader.loadImage(url) { [weak self] result in
            guard let self else { return }
            defer { uuidMap.removeValue(forKey: imageView) }
            let image = try? result.get()
            DispatchQueue.main.async { [weak imageView] in
                guard let imageView else { return }
                imageView.image = image
            }
        }
        if let token {
            uuidMap[imageView] = token
        }
    }
    
    internal func cancel(for imageView: UIImageView) {
        if let uuid = uuidMap[imageView] {
            imageLoader.cancelLoad(uuid)
            uuidMap.removeValue(forKey: imageView)
        }
    }
}
