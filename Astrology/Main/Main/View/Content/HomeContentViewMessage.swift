//
//  HomeContentViewMessage.swift
//  Astrology
//
//  Created by mac on 27.12.2022.
//

import UIKit

class HomeContentViewMessage: HomeContentViewItem {
    
    private let elipseImageView = UIImageView(image: UIImage(named: "message-button-elipse"))
        
    private let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
        
        button.titleLabel?.font = .boldGothamPro(ofSize: 20)
        button.setTitle("Send", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 20
        
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldGothamPro(ofSize: 18)
        label.textAlignment = .left
        label.textColor = .white
        label.text = "Personal consultation with an astrologer"
        label.numberOfLines = 0
        return label
    }()
    
    var coordinator: HomeCoordinator?
    
    init(coordinator: HomeCoordinator?) {
        self.coordinator = coordinator
        super.init()

        setup()
    }
    
    
    override func layout() {
        super.layout()
        
        elipseImageView.translatesAutoresizingMaskIntoConstraints = false
        
//        addSubview(elipseImageView)
        addSubview(sendButton)
        addSubview(label)

        NSLayoutConstraint.activate([
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -20),
            sendButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            sendButton.heightAnchor.constraint(equalToConstant: 40),
            sendButton.widthAnchor.constraint(equalToConstant: 100),
            
            
            label.leadingAnchor.constraint(equalTo: leadingAnchor,
                                           constant: 20),
            label.topAnchor.constraint(equalTo: topAnchor,
                                       constant: 20),
            label.bottomAnchor.constraint(equalTo: bottomAnchor,
                                          constant: -24),
            label.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor,
                                            constant: -20),
            
            
//            elipseImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            elipseImageView.topAnchor.constraint(equalTo: topAnchor),
//            elipseImageView.heightAnchor.constraint(equalTo: heightAnchor,
//                                                    multiplier: 0.65),
//            elipseImageView.widthAnchor.constraint(equalTo: elipseImageView.heightAnchor,
//                                                   multiplier: 1.4),
        ])
        
        layoutIfNeeded()
    }
    
    @objc
    private func sendTapped() {
        coordinator?.eventOccured(.message)
    }
    
    private func setup() {
        backgroundColor = UIColor(red: 136/255, green: 94/255, blue: 1.0, alpha: 0.15)
        
        layer.cornerRadius = 20
        layer.masksToBounds = true
        layer.borderColor = UIColor(red: 148/255, green: 92/255, blue: 246/255, alpha: 1.0).cgColor
        layer.borderWidth = 0.75
        
        sendButton.addTarget(self, action: #selector(sendTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
