//
//  TabBarController.swift
//  Astrology
//
//  Created by mac on 12.01.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    private lazy var matchButton = createButton(image: Icon.match, tag: 0)
    private lazy var matchLabel = createLabel(text: "Match")
    
    private lazy var homeButton = createButton(image: Icon.home, tag: 1)
    
    private lazy var profileButton = createButton(image: Icon.profile, tag: 2)
    private lazy var profileLabel = createLabel(text: "Profile")
    
    init(viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        
        self.viewControllers = viewControllers
        
        selectedIndex = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = tabBar.bounds
        gradientLayer.colors = [
            UIColor(red: 57/255, green: 51/255, blue: 69/255, alpha: 1.0).cgColor,
            UIColor(red: 43/255, green: 32/255, blue: 63/255, alpha: 1.0).cgColor,
            UIColor(red: 32/255, green: 20/255, blue: 56/255, alpha: 1.0).cgColor
        ]
        gradientLayer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        gradientLayer.cornerRadius = tabBar.layer.cornerRadius
        
        tabBar.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        selectedIndex = sender.tag
    }
    
    private func setup() {
        tabBar.backgroundColor =  UIColor(red: 43/255, green: 32/255, blue: 63/255, alpha: 1.0)
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white
        
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.cornerRadius = 20
        tabBar.layer.masksToBounds = true
    }
    
    private func layout() {
        view.addSubview(homeButton)
        
        view.addSubview(matchLabel)
        view.addSubview(matchButton)
        
        view.addSubview(profileLabel)
        view.addSubview(profileButton)
        
        NSLayoutConstraint.activate([
            homeButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            homeButton.bottomAnchor.constraint(equalTo: tabBar.safeAreaLayoutGuide.bottomAnchor),
            homeButton.widthAnchor.constraint(equalToConstant: 64),
            homeButton.heightAnchor.constraint(equalTo: homeButton.widthAnchor),
            
            
            matchLabel.bottomAnchor.constraint(equalTo: tabBar.safeAreaLayoutGuide.bottomAnchor,
                                               constant: -4),
            matchLabel.centerXAnchor.constraint(equalTo: matchButton.centerXAnchor),
            matchLabel.heightAnchor.constraint(equalToConstant: 12),
            
            
            matchButton.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor,
                                                 constant: 56),
            matchButton.topAnchor.constraint(equalTo: tabBar.topAnchor,
                                             constant: 6),
            matchButton.bottomAnchor.constraint(equalTo: matchLabel.topAnchor,
                                               constant: -4),
            matchButton.widthAnchor.constraint(equalTo: matchButton.heightAnchor),
            
            
            profileLabel.bottomAnchor.constraint(equalTo: tabBar.safeAreaLayoutGuide.bottomAnchor,
                                                 constant: -4),
            profileLabel.centerXAnchor.constraint(equalTo: profileButton.centerXAnchor),
            profileLabel.heightAnchor.constraint(equalToConstant: 12),
            
            
            
            profileButton.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor,
                                                    constant: -56),
            profileButton.topAnchor.constraint(equalTo: tabBar.topAnchor,
                                               constant: 6),
            profileButton.bottomAnchor.constraint(equalTo: profileLabel.topAnchor,
                                                  constant: -4),
            profileButton.widthAnchor.constraint(equalTo: profileButton.heightAnchor)
        ])
    }
    
    private func createButton(image: UIImage?, tag: Int) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(image, for: .normal)
        button.tag = tag
        
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        return button
    }
    
    private func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .mediumGothamPro(ofSize: 12)
        label.textColor = .white
        label.textAlignment = .center
        label.text = text
    

        return label
    }
}
