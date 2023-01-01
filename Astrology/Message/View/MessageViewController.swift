//
//  MessageViewController.swift
//  Astrology
//
//  Created by mac on 30.12.2022.
//

import UIKit

class MessageViewController: ViewController {
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Copperplate Bold", size: 24)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.text = "Write a letter to the astrologer and get an individual answer within 24 hours!"
        
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont(name: "Copperplate Bold", size: 24)
//        label.textColor = .systemYellow
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        let attributedString = NSMutableAttributedString()
        attributedString.append(
            NSAttributedString(
                string: "Important!\n",
                attributes: [
                    .font : UIFont.boldSystemFont(ofSize: 26),
                    .foregroundColor : UIColor.systemYellow
                ]
            )
        )
        attributedString.append(
            NSAttributedString(
                string: "Price for a personal message is 3.99$",
                attributes: [
                    .font : UIFont.systemFont(ofSize: 20),
                    .foregroundColor : UIColor.systemYellow
                ]
            )
        )
        
        label.attributedText = attributedString
        
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "message")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let writeMessageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.setTitle("Write a message!", for: .normal)
        button.backgroundColor = .systemTeal.withAlphaComponent(0.35)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
    }
    
    @objc
    private func backTapped() {
        coordinator.eventOccured(.pop)
    }
    
    private func setup() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 23/255, alpha: 1.0)

        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
    }
    
    private func layout() {
        view.addSubview(backButton)
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(priceLabel)
        view.addSubview(writeMessageButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 8),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 32),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor,
                                              multiplier: 0.6),
            
            
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: 64),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: 40),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: -40),
            imageView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                            constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 48),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -48),
            
            
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: 24),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: -24),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                            constant: 12),
            
            
            writeMessageButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor,
                                                    constant: 24),
            writeMessageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            writeMessageButton.widthAnchor.constraint(equalToConstant: 200),
            writeMessageButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
