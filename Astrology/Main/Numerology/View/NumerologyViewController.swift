//
//  NumerologyViewController.swift
//  Astrology
//
//  Created by mac on 31.12.2022.
//

import UIKit

class NumerologyViewController: ViewController {
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(Icon.arrowLeft, for: .normal)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .boldGothamPro(ofSize: 40)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
                
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .blackGothamPro(ofSize: 140)
        label.textAlignment = .center
        
        label.layer.shadowColor = UIColor(red: 216/255, green: 152/255, blue: 1, alpha: 1.0).cgColor
        label.layer.shadowRadius = 4
        label.layer.shadowOffset.height = 1
        label.layer.shadowOpacity = 0.75
        
        label.transform = CGAffineTransform(rotationAngle: 0.25)
        
        return label
    }()
    
    private let numberTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .blackGothamPro(ofSize: 24)
        label.textAlignment = .center
        label.textColor = UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
        
        label.text = "Independence"
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .mediumGothamPro(ofSize: 20)
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private let numerology: Numerology
    
    let coordinator: HomeCoordinator
    
    init(numerologyType: Numerology, coordinator: HomeCoordinator) {
        self.numerology = numerologyType
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        super.layout()
        
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(numberLabel)
        view.addSubview(numberTitleLabel)
        view.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 8),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor),
            
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor,
                                            constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 36),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -36),
            
            
            numberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                             constant: 32),
            
            
            numberTitleLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor,
                                                  constant: 8),
            numberTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            numberTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),


            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                      constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                       constant: -20),
            descriptionLabel.topAnchor.constraint(equalTo: numberTitleLabel.bottomAnchor,
                                                  constant: 24),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                     constant: -16)
        ])
    }
    
    override func setup() {
        super.setup()
        
        view.backgroundColor = .black
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = UIImage(named: "numerology-bg")
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)

        titleLabel.attributedText = NSAttributedString(
            string: numerology.title,
            attributes: [
                .foregroundColor : UIColor.clear,
                .strokeColor : UIColor.white,
                .strokeWidth : -4
            ]
        )
        
        numberLabel.attributedText = NSAttributedString(
            string: String(describing: numerology.number),
            attributes: [
                .foregroundColor : UIColor(red: 157/255, green: 60/255, blue: 1, alpha: 1.0),
                .strokeColor : UIColor(red: 216/255, green: 152/255, blue: 1, alpha: 1.0),
                .strokeWidth : -1
            ]
        )
        
        numberTitleLabel.text = numerology.numberTitle
        
        descriptionLabel.text = numerology.description
    }
    
    @objc
    private func backTapped() {
        coordinator.eventOccured(.pop)
    }
}
