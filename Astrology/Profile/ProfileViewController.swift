//
//  ProfileViewController.swift
//  Astrology
//
//  Created by mac on 12.01.2023.
//

import UIKit

class ProfileViewController: ViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .boldGothamPro(ofSize: 36)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Profile"
        
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.backgroundColor = .gray
        
        imageView.layer.cornerRadius = 60
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .boldGothamPro(ofSize: 26)
        label.textColor = .white
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    let coordinator: ProfileCoordinator
    
    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setup() {
        super.setup()
        
        setBackground(image: UIImage(named: "profile-bg"))
        
        nameLabel.text = "Petro Poroshenko"
    }

    override func layout() {
        super.layout()
        
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 32),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                           constant: 32),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: 32),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: -32),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                           constant: 24)
        ])
    }
    
}
