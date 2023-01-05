//
//  NumerologyViewController.swift
//  Astrology
//
//  Created by mac on 31.12.2022.
//

import UIKit

class NumerologyViewController: ViewController {
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        return button
    }()

    private let titleLabel: NumerologyTitleLabel = {
        let label = NumerologyTitleLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "What the numbers says about you?"
        
        return label
    }()
    
    private let collectionView: NumerologyCollectionView = {
        let collectionView = NumerologyCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.contentInset.top = titleLabel.frame.minY + 8
    }
    
    @objc
    private func backTapped() {
        coordinator.eventOccured(.pop)
    }
    
    private func layout() {
        view.addSubview(collectionView)
        view.addSubview(backButton)
        view.addSubview(titleLabel)

        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 8),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 32),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor,
                                              multiplier: 0.6),
            
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor,
                                            constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -16),
            
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setup() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 23/255, alpha: 1.0)
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
        collectionView.scrollHandler = { [weak titleLabel] collectionView in
            guard let titleLabel = titleLabel else {
                return
            }
            
            let offsetY = -collectionView.contentOffset.y
            let insetTop = collectionView.contentInset.top
            
            if offsetY <= (insetTop + 14), titleLabel.alpha == 1 {
                titleLabel.animate(shouldHide: true)
            }
                    
            if offsetY >= (insetTop + 18), titleLabel.alpha == 0 {
                titleLabel.animate(shouldHide: false)
            }
            
        }
    }
}
