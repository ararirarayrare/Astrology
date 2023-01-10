//
//  MainContentViewNumerology.swift
//  Astrology
//
//  Created by mac on 26.12.2022.
//

import UIKit

class MainContentViewNumerology: MainContentViewItem {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Numerology"
        
        return label
    }()
    
    private let collectionView: MainContentViewNumerologyCollectionView = {
        let numbers = [
            "Destiny number" : 8,
            "Radial number" : 1,
            "Evil number" : 7,
            "Name number" : 23
        ]
        
        let collectionView = MainContentViewNumerologyCollectionView(numbers: numbers)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    let coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        super.init()
            
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
    }
    
    override func layout() {
        super.layout()
        
        addSubview(titleLabel)
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                               constant: 40),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -40),
            
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                constant: 20),
            collectionView.heightAnchor.constraint(equalToConstant: 200.0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
