//
//  LocalEsimViewController.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import UIKit

final class LocalEsimViewController: UIViewController {
    
    deinit { print("\(type(of: self)) is being deallocated") }

    @available(*, unavailable) required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }

    init(viewModel: LocalEsimViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
        
    private let viewModel: LocalEsimViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
