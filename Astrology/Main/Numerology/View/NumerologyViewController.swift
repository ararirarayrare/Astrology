//
//  NumerologyViewController.swift
//  Astrology
//
//  Created by mac on 31.12.2022.
//

import UIKit

final class NumerologyViewController: ViewController {
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(Icon.arrowLeft, for: .normal)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .regularNunitoFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
                
        return label
    }()
    
//    private let numberLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        label.font = .blackGothamPro(ofSize: 140)
//        label.textAlignment = .center
//
//        label.layer.shadowColor = UIColor(red: 216/255, green: 152/255, blue: 1, alpha: 1.0).cgColor
//        label.layer.shadowRadius = 4
//        label.layer.shadowOffset.height = 1
//        label.layer.shadowOpacity = 0.75
//
//        label.transform = CGAffineTransform(rotationAngle: 0.25)
//
//        return label
//    }()
//
//    private let numberTitleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        label.font = .blackGothamPro(ofSize: 24)
//        label.textAlignment = .center
//        label.textColor = UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
//
//        label.text = "Independence"
//
//        return label
//    }()
//
//    private let descriptionLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        label.font = .mediumGothamPro(ofSize: 20)
//        label.textAlignment = .left
//        label.textColor = .white
//        label.numberOfLines = 0
//        label.adjustsFontSizeToFitWidth = true
//
//        return label
//    }()
    
    private let contentView: NumerologyContentView = {
        let view = NumerologyContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
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
    
    override func setup() {
        super.setup()
        
        setBackground(image: .background2)
        
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)

        titleLabel.attributedText = NSAttributedString(
            string: numerology.title,
            attributes: [
                .foregroundColor : UIColor.clear,
                .strokeColor : UIColor.white,
                .strokeWidth : -4
            ]
        )
        
        contentView.numberLabel.attributedText = NSAttributedString(
            string: String(describing: numerology.number),
            attributes: [
                .foregroundColor : UIColor(red: 122/255, green: 194/255, blue: 224/255, alpha: 1.0),
                .strokeColor : UIColor(red: 216/255, green: 152/255, blue: 1, alpha: 1.0),
                .strokeWidth : -1
            ]
        )
                
        contentView.descriptionLabel.text = numerology.description
    }
    
    override func layout() {
        super.layout()
        
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(contentView)
//        view.addSubview(numberLabel)
//        view.addSubview(numberTitleLabel)
//        view.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 8),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor),
            
            
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 36),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -36),
            
            
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                 constant: 20),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                  constant: -20),
            contentView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                             constant: 48),
            contentView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                constant: -24)
            
            
//            numberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            numberLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
//                                             constant: 32),
//
//
//            numberTitleLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor,
//                                                  constant: 8),
//            numberTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
//            numberTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
//
//
//            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
//                                                      constant: 20),
//            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
//                                                       constant: -20),
//            descriptionLabel.topAnchor.constraint(equalTo: numberTitleLabel.bottomAnchor,
//                                                  constant: 24),
//            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor,
//                                                     constant: -16)
        ])
    }
    
    @objc
    private func backTapped() {
        coordinator.eventOccured(.pop)
    }
}
