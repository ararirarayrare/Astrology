//
//  MainContentViewMessage.swift
//  Astrology
//
//  Created by mac on 27.12.2022.
//

import UIKit

class MainContentViewMessage: MainContentViewItem {
    
    private let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitle("Chat", for: .normal)
        button.backgroundColor = .systemTeal.withAlphaComponent(0.35)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .white
        label.text = "Write a letter to the astrologer and get an individual answer within 24 hours"
        label.numberOfLines = 0
        return label
    }()
    
    override init() {
        super.init()

        backgroundColor = .blue.withAlphaComponent(0.4)
        layer.cornerRadius = 20
    }
    
    
    override func layout() {
        super.layout()
        
        addSubview(sendButton)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -20),
            sendButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            sendButton.heightAnchor.constraint(equalToConstant: 40),
            sendButton.widthAnchor.constraint(equalToConstant: 120),
            
            
            label.leadingAnchor.constraint(equalTo: leadingAnchor,
                                           constant: 20),
            label.topAnchor.constraint(equalTo: topAnchor,
                                       constant: 24),
            label.bottomAnchor.constraint(equalTo: bottomAnchor,
                                          constant: -24),
            label.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor,
                                            constant: -24)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
