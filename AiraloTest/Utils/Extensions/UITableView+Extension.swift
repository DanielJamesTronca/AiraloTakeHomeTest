//
//  UITableView+Extension.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation

import UIKit

protocol Reusable {
    /// String that will be used as a implicit reuseIdentifier
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String { String(describing: self) }
}

extension UITableView {
    /// This method register a Reusable cell
    /// - Parameter cell: Cell Type, also  used to retrieve the reuseIdentifier
    func register<T: UITableViewCell>(cell: T.Type) where T: Reusable {
        self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    /// This method register a Reusable HeaderFooterView
    /// - Parameter cell: Cell Type used to retrieve the reuseIdentifier
    func registerForHeaderFooterView<T: UITableViewHeaderFooterView>(cell: T.Type) where T: Reusable {
        self.register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    /// This method dequeue a Reusable cell based on the Type given in input
    /// - Parameters:
    ///   - indexPath: The index path that specifies the location of the new supplementary view.
    ///   - type: Type of the given cell
    /// - Returns: The cell dequeued from the tableView
    func dequeue<T: UITableViewCell>(indexPath: IndexPath, type: T.Type = T.self) -> T where T: Reusable {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            preconditionFailure("Cannot dequeue, check if this cell has been registered")
        }
        return cell
    }
    
    /// This method dequeue a Reusable HeaderFooterView based on the Type given in input
    /// - Parameters:
    ///   - type: Type of the given cell
    /// - Returns: The view dequeued from the tableView
    func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>(type: T.Type = T.self) -> T where T: Reusable {
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            preconditionFailure("Cannot dequeue, check if this cell has been registered")
        }
        return view
    }
}
