//
//  EsimTableViewCell.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import UIKit

final class EsimTableViewCell: UITableViewCell, Reusable {
    
    private lazy var cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var cellLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = .zero
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .secondaryLabel
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cellImageView, cellLabel, arrowImageView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = App.Margin.medium
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.15
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 10
        view.layer.cornerRadius = 10
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func configure(with esim: LocalEsimElement) {
        cellLabel.text = esim.title
        if let url = esim.imageUrl {
            cellImageView.loadImage(at: url)
        }
        // Adjust arrow direction for RTL languages
        if UIView.userInterfaceLayoutDirection(for: arrowImageView.semanticContentAttribute) == .rightToLeft {
            arrowImageView.image = UIImage(systemName: "chevron.left")
        } else {
            arrowImageView.image = UIImage(systemName: "chevron.right")
        }
    }
    
    private func layout() {
        contentView.addSubview(containerView)
        containerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: App.Margin.large),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -App.Margin.large),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: App.Margin.large),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -App.Margin.medium),
            
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: App.Margin.extraLarge),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -App.Margin.extraLarge),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: App.Margin.large),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -App.Margin.large),
            
            cellImageView.widthAnchor.constraint(equalToConstant: 37),
            cellImageView.heightAnchor.constraint(equalToConstant: 28)
        ])
        handleRtlLayout()
    }
    
    private func handleRtlLayout() {
        // Handle RTL layout by adjusting the alignment
        if UIView.userInterfaceLayoutDirection(for: containerView.semanticContentAttribute) == .rightToLeft {
            cellLabel.textAlignment = .right
            cellImageView.semanticContentAttribute = .forceRightToLeft
            arrowImageView.semanticContentAttribute = .forceRightToLeft
        } else {
            cellLabel.textAlignment = .left
            cellImageView.semanticContentAttribute = .forceLeftToRight
            arrowImageView.semanticContentAttribute = .forceLeftToRight
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellLabel.text = nil
        cellImageView.image = nil
        arrowImageView.image = nil
        cellImageView.cancelImageLoad()
    }
}
