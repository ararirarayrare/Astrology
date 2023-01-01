//
//  NumerologyCollectionViewCell.swift
//  Astrology
//
//  Created by mac on 01.01.2023.
//

import UIKit

class NumerologyCollectionViewCell: UICollectionViewCell {
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 60)
        label.textColor = .systemYellow
        label.textAlignment = .center
        
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 0, green: 0, blue: 110/255, alpha: 1.0)
        layer.cornerRadius = 24
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(titleLabel)
        addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                               constant: -20),
            
            
            numberLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            numberLabel.topAnchor.constraint(equalTo: topAnchor,
                                             constant: 20),
            numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            numberLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor,
                                                constant: -24)
        ])
    }
    
    func setup(tiitle: String, number: Int) {
        titleLabel.text = tiitle
        numberLabel.text = String(describing: number)
    }
    
}

