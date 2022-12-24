//
//  MainTableViewHeader.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class MainTableViewHeader: UIView {
    
    private let collectionView: MainTableViewHeaderCollectionView = {
        let collectionView = MainTableViewHeaderCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .clear
        
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
