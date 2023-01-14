//
//  HelpViewController.swift
//  Astrology
//
//  Created by mac on 13.01.2023.
//

import UIKit

class HelpViewController: ViewController {
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(Icon.arrowLeft, for: .normal)
        button.tintColor = .white
        return button
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
        
        setBackground(image: .background1)
        
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
    }
    
    override func layout() {
        super.layout()
        
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 12),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor)
        ])
    }
    
    @objc
    private func backTapped() {
        coordinator.eventOccured(.pop)
    }
}
