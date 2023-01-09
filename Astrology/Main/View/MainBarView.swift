//
//  MainHeaderView.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class MainBarView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Copperplate Bold", size: 24)
        label.textColor = .white
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
                
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM"
        
        let today = Date()

        let dateString = dateFormatter.string(from: today)
        
        dateFormatter.dateFormat = "EEEE"
        let weekdayString = dateFormatter.string(from: today)
        
        let attributedString = NSMutableAttributedString(string: dateString + ",\n")
        attributedString.append(
            NSAttributedString(
                string: weekdayString,
                attributes: [
                    .foregroundColor : UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
                ]
            )
        )
        
        label.attributedText = attributedString
        
        return label
    }()
    
    private let messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "chat-button"), for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    let coordinator: MainCoordinator
            
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        super.init(frame: .zero)
        
        setup()
        layout()
    }
    
    @objc
    private func messageTapped() {
        coordinator.eventOccured(.message)
    }
    
    private func setup() {
        backgroundColor = .clear

        messageButton.addTarget(self, action: #selector(messageTapped), for: .touchUpInside)
    }

    private func layout() {
        addSubview(messageButton)
        addSubview(titleLabel)
                
        NSLayoutConstraint.activate([
            messageButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                    constant: -20),
            messageButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                               constant: 16),
            messageButton.widthAnchor.constraint(equalToConstant: 40),
            messageButton.heightAnchor.constraint(equalToConstant: 40),
            
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 16),
            titleLabel.topAnchor.constraint(equalTo: messageButton.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: messageButton.leadingAnchor,
                                                 constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                               constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}