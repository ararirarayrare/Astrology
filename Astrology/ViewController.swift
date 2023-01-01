//
//  ViewController.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    let coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class NavigationController: UINavigationController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.prefersLargeTitles = true
        navigationBar.isHidden = true
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [
            .font : UIFont(name: "Copperplate Bold", size: 32) ?? .boldSystemFont(ofSize: 28)
        ]
        appearance.configureWithTransparentBackground()
        
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
    
}

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}
