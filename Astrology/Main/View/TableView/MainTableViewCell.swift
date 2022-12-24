//
//  MainTableViewCell.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setup(text: String) {
        
        backgroundColor = .clear

        label.text = text
        addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor,
                                          constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor,
                                           constant: -20),
            label.topAnchor.constraint(equalTo: topAnchor,
                                      constant: 16),
            label.bottomAnchor.constraint(equalTo: bottomAnchor,
                                         constant: -16)
        ])
        
    }
    
}
