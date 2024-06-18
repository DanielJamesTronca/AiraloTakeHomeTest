//
//  UIView+Extension.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import UIKit

extension UIView {
    internal func addContentView(_ subView: UIView) {
        addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subView.topAnchor.constraint(equalTo: topAnchor),
            subView.bottomAnchor.constraint(equalTo: bottomAnchor),
            subView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: trailingAnchor)])
    }
    
    /// Pins to the subview to its edges with the given margins.
    /// - Parameter subView: The view to be added as a subview.
    /// - Parameter margins: The margins of the subview (negative values for bottom and right margins).
    /// - Note: Remember to use negative values for bottom and right margins.
    public func addContentViewWithCustomMargins(_ subView: UIView, margins: UIEdgeInsets) {
        addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subView.topAnchor.constraint(equalTo: topAnchor, constant: margins.top),
            subView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: margins.bottom),
            subView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margins.left),
            subView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: margins.right)
        ])
    }
}
