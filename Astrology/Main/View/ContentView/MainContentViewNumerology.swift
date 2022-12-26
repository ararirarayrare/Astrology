//
//  MainContentViewNumerology.swift
//  Astrology
//
//  Created by mac on 26.12.2022.
//

import UIKit

class MainContentViewNumerology: UIView {
    
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
    
    init() {
        super.init(frame: .zero)
        
        isUserInteractionEnabled = true
                        
        backgroundColor = .clear
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        backgroundImageView.addGestureRecognizer(tapGesture)

        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc
    private func tapped() {
        print("tapped")
    }
    
    private func layout() {
        addSubview(backgroundImageView)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                         constant: 24),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                          constant: -24),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor,
                                                     constant: 4),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                        constant: -4),
            
            
            button.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor,
                                             constant: -12),
            button.heightAnchor.constraint(equalTo: backgroundImageView.heightAnchor,
                                           multiplier: 0.4),
            button.widthAnchor.constraint(equalTo: button.heightAnchor,
                                          multiplier: 0.65),
            button.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor)
        ])
    }
    
}
