//
//  MainContentViewPredictionToday.swift
//  Astrology
//
//  Created by mac on 26.12.2022.
//

import UIKit

class MainContentViewPrediction: MainContentViewItem {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.textAlignment = .left
    
        return label
    }()
    
    private let predictionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    init(title: String, prediction: String) {
        super.init()
        
        backgroundColor = .clear
        
        titleLabel.text = title
        predictionLabel.text = prediction
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        super.layout()
        
        addSubview(titleLabel)
        addSubview(predictionLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 24),
            titleLabel.topAnchor.constraint(equalTo: topAnchor,
                                            constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -24),
            
            
            predictionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            predictionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            predictionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                 constant: 12),
            predictionLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                    constant: -24)
        ])
    }
    
}
