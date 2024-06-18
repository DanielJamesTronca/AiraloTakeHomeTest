//
//  LocalEsimViewController.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import UIKit

final class LocalEsimViewController: UIViewController, Alertable {
    
    deinit { print("\(type(of: self)) is being deallocated") }

    @available(*, unavailable) required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }

    init(viewModel: LocalEsimViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
        
    private let viewModel: LocalEsimViewModel
    
    private lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func loadView() {
        super.loadView()
        layout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    private func setupBindings() {
        viewModel.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                self?.handleState(state)
            }
            .store(in: &viewModel.cancellables)
    }
    
    private func handleState(_ state: State) {
        assert(Thread.isMainThread)
        switch state {
        case .loading:
            LoadingView.show()
        case .loaded:
            LoadingView.hide()
            tableView.reloadData()
            if viewModel.dataSource.isEmpty {
                handleEmptyState()
            } else {
                contentUnavailableConfiguration = nil
                setNeedsUpdateContentUnavailableConfiguration()
            }
        case .failed(let error):
            LoadingView.hide()
            showAlert(message: error.localizedDescription)
        case .idle:
            LoadingView.hide()
        }
    }
    
    private func handleEmptyState() {
        var config = UIContentUnavailableConfiguration.empty()
        config.image = UIImage(systemName: "binoculars")
        config.text = "Empty title"
        config.secondaryText = "Empty description"
        contentUnavailableConfiguration = config
    }
    
    private func layout() {
        view.addContentView(tableView)
    }
}

extension LocalEsimViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension LocalEsimViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
