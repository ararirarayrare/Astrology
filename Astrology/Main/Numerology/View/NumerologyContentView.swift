//
//  NumerologyContentView.swift
//  Astrology
//
//  Created by mac on 21.01.2023.
//

import UIKit


class NumerologyContentView: UIView {
    
    private var borderLayer: CALayer?
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .boldLato(ofSize: 140)
        label.textAlignment = .center
//        label.textColor = UIColor(red: 122/255, green: 194/255, blue: 224/255, alpha: 1.0)
        
        label.layer.shadowColor = UIColor(red: 216/255, green: 152/255, blue: 1, alpha: 1.0).cgColor
        label.layer.shadowRadius = 4
        label.layer.shadowOffset.height = 1
        label.layer.shadowOpacity = 0.75
        
        label.transform = CGAffineTransform(rotationAngle: 0.25)
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .regularNunitoFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        setup()
        layout()
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
    
    private func setup() {
        backgroundColor = UIColor(red: 141/255, green: 112/255, blue: 1, alpha: 0.1)
        
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }
    
    private func layout() {
        addSubview(numberLabel)
        addSubview(descriptionLabel)

        
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: topAnchor,
                                             constant: 20),
            numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberLabel.heightAnchor.constraint(equalToConstant: 120),
            
            
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                      constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                       constant: -24),
            descriptionLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor,
                                                  constant: 24),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                     constant: -24)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
