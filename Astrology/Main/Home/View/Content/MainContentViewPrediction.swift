//
//  MainContentViewPredictionToday.swift
//  Astrology
//
//  Created by mac on 26.12.2022.
//

import UIKit

class MainContentViewPrediction: MainContentViewItem {
        
    private let instagramButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(Icon.instagram, for: .normal)
        
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .left
    
        return label
    }()
    
    private let predictionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .mediumGothamPro(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
        
        button.titleLabel?.font = .boldGothamPro(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("More", for: .normal)
        
        button.layer.cornerRadius = 20
        
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

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = UIColor(red: 141/255, green: 112/255, blue: 1, alpha: 0.15)
        
        layer.borderColor = UIColor(red: 211/255, green: 195/255, blue: 243/255, alpha: 1.0).cgColor
        layer.borderWidth = 0.75
        layer.cornerRadius = 20
    }

    override func layout() {
        super.layout()
        
        addSubview(instagramButton)
        addSubview(titleLabel)
        addSubview(predictionLabel)
        addSubview(moreButton)
                
        NSLayoutConstraint.activate([
            instagramButton.topAnchor.constraint(equalTo: topAnchor,
                                                constant: 24),
            instagramButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                      constant: -20),
            instagramButton.heightAnchor.constraint(equalToConstant: 20),
            instagramButton.widthAnchor.constraint(equalTo: instagramButton.heightAnchor),
            
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor,
                                            constant: 28),
            titleLabel.trailingAnchor.constraint(equalTo: instagramButton.leadingAnchor,
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
            moreButton.heightAnchor.constraint(equalToConstant: 40),
            moreButton.widthAnchor.constraint(equalToConstant: 120),
            moreButton.bottomAnchor.constraint(equalTo: bottomAnchor,
                                               constant: -32)
        ])
    
    }
}
