//
//  MainHeaderView.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class MainHeaderView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Copperplate Bold", size: 24)
        label.textColor = .white
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        
        label.text = "Saturday, 24 December"
        
        return label
    }()
            
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .clear
        
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 16),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                            constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
