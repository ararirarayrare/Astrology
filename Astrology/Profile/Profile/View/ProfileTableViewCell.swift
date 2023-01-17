//
//  ProfileTableViewCell.swift
//  Astrology
//
//  Created by mac on 13.01.2023.
//

import UIKit

final class ProfileTableViewCell: UITableViewCell {
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.tintColor = .white
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .mediumGothamPro(ofSize: 20)
        label.textAlignment = .left
        label.textColor = .white
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        layout()
    }
    
    private func layout() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                   constant: 24),
            iconImageView.topAnchor.constraint(equalTo: topAnchor,
                                               constant: 24),
            iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                  constant: -24),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
            
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor,
                                                constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

