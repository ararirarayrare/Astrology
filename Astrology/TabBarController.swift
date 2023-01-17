//
//  TabBarController.swift
//  Astrology
//
//  Created by mac on 12.01.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
        
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
    }

    private func setup() {
        tabBar.backgroundColor =  UIColor(red: 20/255, green: 12/255, blue: 32/255, alpha: 1.0)
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white
        
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.cornerRadius = 24
        tabBar.layer.masksToBounds = true
    }
}
