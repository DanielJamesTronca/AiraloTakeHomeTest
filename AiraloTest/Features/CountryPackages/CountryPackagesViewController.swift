//
//  CountryPackagesViewController.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import UIKit

final class CountryPackagesViewController: UIViewController {
    
    deinit { print("\(type(of: self)) is being deallocated") }

    @available(*, unavailable) required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }

    init(viewModel: CountryPackagesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
        
    private let viewModel: CountryPackagesViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
