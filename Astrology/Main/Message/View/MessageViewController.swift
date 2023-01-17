//
//  MessageViewController.swift
//  Astrology
//
//  Created by mac on 30.12.2022.
//

import UIKit

final class MessageViewController: ViewController {
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(Icon.arrowLeft, for: .normal)
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
        label.numberOfLines = 0
        
        let attributedString = NSMutableAttributedString()
        
        attributedString.append(
            NSAttributedString(
                string: "Online",
                attributes: [
                    .font : UIFont.mediumGothamPro(ofSize: 14) ?? .systemFont(ofSize: 14),
                    .foregroundColor : UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
                ]
            )
        )
        
        attributedString.append(
            NSAttributedString(
                string: "\n\nKatrina Loo",
                attributes: [
                    .font : UIFont.boldGothamPro(ofSize: 20) ?? .boldSystemFont(ofSize: 20),
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
        
        label.font = .mediumGothamPro(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.text = "Write a letter to an astrologer and get an individual answer within 24 hours"
        
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .mediumGothamPro(ofSize: 12)
        label.textColor = UIColor(red: 199/255, green: 199/255, blue: 199/255, alpha: 1.0)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.text = "*price of a personal consultation is 3.99$"
        
        return label
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.titleLabel?.font = .boldGothamPro(ofSize: 20)
        button.setTitle("Send", for: .normal)
        button.backgroundColor = UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    let coordinator: HomeCoordinator
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
    }
    
    override func setup() {
        super.setup()
        
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = UIImage(named: "message-bg")
        view.addSubview(backgroundImageView)

        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
        avatarImageView.image = UIImage(named: "avatar")
        
    }
    
    override func layout() {
        super.layout()
        
        view.addSubview(backButton)
        view.addSubview(avatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(priceLabel)
        view.addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 12),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor),
            

            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
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
    
    @objc
    private func backTapped() {
        coordinator.eventOccured(.pop)
    }
    
}
