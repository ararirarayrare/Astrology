//
//  MainContentViewNumerology.swift
//  Astrology
//
//  Created by mac on 26.12.2022.
//

import UIKit

class MainContentViewNumerology: MainContentViewItem {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        
        imageView.image = UIImage(named: "numerology")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()

    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .white
        return button
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
    
    @objc
    private func tapped() {
        coordinator.eventOccured(.numerology)
    }
    
    override func layout() {
        super.layout()
        addSubview(backgroundImageView)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            button.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor,
                                             constant: -12),
            button.heightAnchor.constraint(equalTo: backgroundImageView.heightAnchor,
                                           multiplier: 0.4),
            button.widthAnchor.constraint(equalTo: button.heightAnchor,
                                          multiplier: 0.65),
            button.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor)
        ])
    }
    
    private func setup() {
        isUserInteractionEnabled = true
                        
        backgroundColor = .clear
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        backgroundImageView.addGestureRecognizer(tapGesture)
    }
    
}
