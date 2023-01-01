//
//  NumerologyViewController.swift
//  Astrology
//
//  Created by mac on 31.12.2022.
//

import UIKit

class NumerologyViewController: ViewController {
    
    private let collectionView: NumerologyCollectionView = {
        let collectionView = NumerologyCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 23/255, alpha: 1.0) 
        
        layout()
    }
    
    private func layout() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
