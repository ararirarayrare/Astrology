//
//  CompatibilityViewController.swift
//  Astrology
//
//  Created by mac on 12.01.2023.
//

import UIKit

class CompatibilityViewController: ViewController {
    
    let coordinator: CompatibilityCoordinator
    
    init(coordinator: CompatibilityCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        
//        tabBarItem.image = Icon.match
//        tabBarItem.title = "Match"
        
        view.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setup() {
        super.setup()
        
     
    }
}
