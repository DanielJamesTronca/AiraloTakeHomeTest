//
//  LoadingView.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import UIKit

final class LoadingView {

    private static var spinner: UIActivityIndicatorView?
    
    static func show() {
        DispatchQueue.main.async {
            NotificationCenter.default.addObserver(self, selector: #selector(update), name: UIDevice.orientationDidChangeNotification, object: nil)
            guard spinner == nil else { return }

            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first(where: { $0.isKeyWindow }) {
                let frame = UIScreen.main.bounds
                let spinner = UIActivityIndicatorView(frame: frame)
                // spinner.backgroundColor = UIColor.black.withAlphaComponent(0.2)
                spinner.style = .large
                spinner.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                window.addSubview(spinner)

                spinner.startAnimating()
                self.spinner = spinner
            }
        }
    }

    static func hide() {
        DispatchQueue.main.async {
            guard let spinner = spinner else { return }
            spinner.stopAnimating()
            spinner.removeFromSuperview()
            self.spinner = nil
            NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
        }
    }

    @objc private static func update() {
        DispatchQueue.main.async {
            if spinner != nil {
                hide()
                show()
            }
        }
    }
}
