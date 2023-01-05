//
//  MainInfoViewDetails.swift
//  Astrology
//
//  Created by mac on 29.12.2022.
//

import UIKit

class MainInfoViewDetails: UIStackView {
    
    init(details: [String : String]) {
        super.init(frame: .zero)
                        
        setup(with: details)
    }
    
    private func createDetailView(title: String, subtitle: String) -> UIView {
        let view = UIView()
//        view.backgroundColor = .black
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 14)
        titleLabel.textColor = .systemTeal
        titleLabel.textAlignment = .left
        titleLabel.text = title
        
        let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = .boldSystemFont(ofSize: 12)
        subtitleLabel.textColor = .white
        subtitleLabel.textAlignment = .left
        subtitleLabel.numberOfLines = 2
        subtitleLabel.text = subtitle
        
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor,
                                           constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                  constant: -4)
        ])
        
        return view
    }
    
    private func setup(with details: [String : String]) {
        axis = .vertical
        spacing = 2
        distribution = .fillEqually
            
        for (title, subtitle) in details {
            let view = createDetailView(title: title, subtitle: subtitle)
            addArrangedSubview(view)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
