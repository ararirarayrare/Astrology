//
//  HomeContentViewPrediction.swift
//  Astrology
//
//  Created by mac on 26.12.2022.
//

import UIKit

class HomeContentViewPrediction: HomeContentViewItem {
    
    private var borderLayer: CALayer?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .regularPoppinsFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .left
    
        return label
    }()
    
    private let predictionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .regularNunitoFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(named: "more-button"), for: .normal)
        
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        return button
    }()
    
    private let instagramButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(Icon.instagram, for: .normal)
        
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        return button
    }()

        
    init(title: String, prediction: String) {
        super.init()
        
        setup()
        
        titleLabel.text = title
        predictionLabel.text = prediction
    }
    
    init(attributedTitle: NSAttributedString, prediction: String) {
        super.init()
        
        setup()
        
        titleLabel.attributedText = attributedTitle
        predictionLabel.text = prediction
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if borderLayer == nil, bounds.size != .zero {
            let gradient = CAGradientLayer()
            gradient.frame = bounds
            gradient.colors = [
                UIColor(red: 122/255, green: 194/255, blue: 224/255, alpha: 1.0).cgColor,
                UIColor(red: 83/255, green: 39/255, blue: 197/255, alpha: 1.0).cgColor
            ]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 1)
            
            gradient.cornerRadius = layer.cornerRadius

            let shape = CAShapeLayer()
            shape.lineWidth = 0.75
            shape.path = UIBezierPath(roundedRect: bounds,
                                      cornerRadius: layer.cornerRadius).cgPath
            shape.strokeColor = UIColor.black.cgColor
            shape.fillColor = UIColor.clear.cgColor
            
            gradient.mask = shape
            
            self.borderLayer = gradient
            
            layer.insertSublayer(gradient, at: 0)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = UIColor(red: 141/255, green: 112/255, blue: 1, alpha: 0.1)
        
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }

    override func layout() {
        super.layout()
        
        addSubview(titleLabel)
        addSubview(predictionLabel)
        addSubview(moreButton)
        addSubview(instagramButton)
                
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor,
                                            constant: 28),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -24),


            predictionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                     constant: 20),
            predictionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                      constant: -20),
            predictionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                 constant: 20),
            
            moreButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            moreButton.topAnchor.constraint(equalTo: predictionLabel.bottomAnchor,
                                            constant: 24),
            moreButton.heightAnchor.constraint(equalToConstant: 48),
            moreButton.widthAnchor.constraint(equalToConstant: 120),
            moreButton.bottomAnchor.constraint(equalTo: bottomAnchor,
                                               constant: -32),
            
            
            instagramButton.centerYAnchor.constraint(equalTo: moreButton.centerYAnchor),
            instagramButton.trailingAnchor.constraint(equalTo: predictionLabel.trailingAnchor),
            instagramButton.heightAnchor.constraint(equalTo: moreButton.heightAnchor,
                                                    multiplier: 0.85),
            instagramButton.widthAnchor.constraint(equalTo: instagramButton.heightAnchor)
        ])
    
    }
}
