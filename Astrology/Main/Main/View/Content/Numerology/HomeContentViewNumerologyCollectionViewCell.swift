//
//  HomeContentViewNumerologyCollectionViewCell.swift
//  Astrology
//
//  Created by mac on 10.01.2023.
//

import UIKit

final class HomeContentViewNumerologyCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFill
        
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
                
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .regularNunitoFont(ofSize: 26)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .regularPoppinsFont(ofSize: 80)
        label.textColor = .white
        label.textAlignment = .center
        
        label.transform = CGAffineTransform(rotationAngle: .random(in: 0.1...0.25))
        
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(Icon.arrowRight, for: .normal)
        
        return button
    }()
    
    private var buttonAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func buttonTapped() {
        buttonAction?()
    }
    
    func setup(withTitle title: String, number: Int, buttonAction: @escaping () -> Void) {
        titleLabel.text = title.replacingOccurrences(of: " ", with: "\n")
        numberLabel.text = String(describing: number)
        self.buttonAction = buttonAction
    }
    
    private func layout() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(numberLabel)
        addSubview(button)
        
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: centerXAnchor,
                                                constant: 32),
            titleLabel.topAnchor.constraint(equalTo: topAnchor,
                                           constant: 20),
            
            
            numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                  constant: -24),
            numberLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                constant: -20),
            
            
            button.leadingAnchor.constraint(equalTo: leadingAnchor,
                                            constant: 20),
            button.bottomAnchor.constraint(equalTo: bottomAnchor,
                                           constant: -20),
            button.widthAnchor.constraint(equalToConstant: 56),
            button.heightAnchor.constraint(equalTo: button.widthAnchor)
        ])
    }
    
}

