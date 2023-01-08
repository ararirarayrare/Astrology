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
        
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0).cgColor
        imageView.layer.borderWidth = 2.0
        
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .center
        label.numberOfLines = 2
        
        let attributedString = NSMutableAttributedString()
        
        attributedString.append(
            NSAttributedString(
                string: "Online",
                attributes: [
                    .font : UIFont(name: "Copperplate", size: 18) ?? .systemFont(ofSize: 14),
                    .foregroundColor : UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
                ]
            )
        )
        
        attributedString.append(
            NSAttributedString(
                string: "\nKatrina Loo",
                attributes: [
                    .font : UIFont(name: "Copperplate Bold", size: 24) ?? .boldSystemFont(ofSize: 20),
                    .foregroundColor : UIColor.white
                ]
            )
        )
        
        label.attributedText = attributedString
        
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont(name: "Copperplate", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.text = "Write a letter to an astrologer and get an individual answer within 24 hours"
        
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont(name: "Copperplate", size: 14)
        label.textColor = UIColor(red: 199/255, green: 199/255, blue: 199/255, alpha: 1.0)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.text = "*price of a personal consultation is 3.99$"
        
        return label
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.titleLabel?.font = UIFont(name: "Copperplate Bold", size: 26)
        button.setTitle("Send", for: .normal)
        button.backgroundColor = UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
    }
    
    @objc
    private func backTapped() {
        coordinator.eventOccured(.pop)
    }
    
    private func setup() {
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = UIImage(named: "message-bg")
        view.addSubview(backgroundImageView)

        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
        avatarImageView.image = UIImage(named: "avatar")
        
    }
    
    private func layout() {
        view.addSubview(backButton)
        view.addSubview(avatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(priceLabel)
        view.addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 8),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 32),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor,
                                              multiplier: 0.6),
            

            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            avatarImageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor,
//                                                 constant: -8),
            avatarImageView.widthAnchor.constraint(equalTo: view.widthAnchor,
                                                   multiplier: 0.4),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor,
                                           constant: 8),
            nameLabel.bottomAnchor.constraint(equalTo: view.centerYAnchor,
                                              constant: 12),
            
            
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                      constant: 48),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                       constant: -48),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,
                                                  constant: 24),
            
            
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceLabel.widthAnchor.constraint(equalToConstant: 160),
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,
                                            constant: 48),
            
            
            sendButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor,
                                            constant: 8),
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 160),
            sendButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
