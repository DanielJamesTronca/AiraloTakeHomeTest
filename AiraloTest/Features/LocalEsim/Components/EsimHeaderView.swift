//
//  EsimHeaderView.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 19/06/24.
//

import UIKit

final class EsimHeaderView: UITableViewHeaderFooterView, Reusable {

    private var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textAlignment = .left
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func layout() {
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: App.Margin.large),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -App.Margin.large),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: App.Margin.large),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -App.Margin.large)
        ])
    }

    internal func configure(with string: String) {
        label.text = string
    }
}
