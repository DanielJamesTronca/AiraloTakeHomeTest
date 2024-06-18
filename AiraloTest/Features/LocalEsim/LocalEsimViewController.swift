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
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: EsimTableViewCell.self)
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
            handleEmptyState()
        case .failed(let error):
            LoadingView.hide()
            showAlert(message: error.localizedDescription)
        case .idle:
            LoadingView.hide()
        }
    }
    
    private func handleEmptyState() {
        if viewModel.dataSource.isEmpty {
            var config = UIContentUnavailableConfiguration.empty()
            config.image = UIImage(systemName: "binoculars")
            config.text = "Empty title"
            config.secondaryText = "Empty description"
            contentUnavailableConfiguration = config
        } else {
            contentUnavailableConfiguration = nil
            setNeedsUpdateContentUnavailableConfiguration()
        }
    }
    
    private func layout() {
        title = App.Localization.genericHello
        view.addContentView(tableView)
    }
}

extension LocalEsimViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(at: indexPath, animated: true) }
        let esim = viewModel.dataSource[indexPath.section].esim[indexPath.row]
        viewModel.didTapLocalEsim(esim: esim)
    }
}

extension LocalEsimViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataSource[section].esim.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let esim = viewModel.dataSource[indexPath.section].esim[indexPath.row]
        let cell: EsimTableViewCell = tableView.dequeue(indexPath: indexPath, type: EsimTableViewCell.self)
        cell.selectionStyle = .none
        cell.configure(with: esim)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.dataSource[section].header
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
