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
        
//        selectedIndex = viewControllers.count > 0 ? (viewControllers.count - 1) / 2 : 0
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
//            UIColor(red: 49/255, green: 39/255, blue: 65/255, alpha: 1.0).cgColor,
            UIColor(red: 43/255, green: 32/255, blue: 63/255, alpha: 1.0).cgColor,
            UIColor(red: 32/255, green: 20/255, blue: 56/255, alpha: 1.0).cgColor
        ]
        gradientLayer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        gradientLayer.cornerRadius = tabBar.layer.cornerRadius
        
        tabBar.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setup() {
        
        tabBar.backgroundColor =  UIColor(red: 43/255, green: 32/255, blue: 63/255, alpha: 1.0)
        tabBar.tintColor = UIColor(red: 110/255, green: 59/255, blue: 1, alpha: 1.0)
        tabBar.unselectedItemTintColor = UIColor(red: 110/255, green: 59/255, blue: 1, alpha: 1.0)
        
        tabBar.itemWidth = 120
        tabBar.itemSpacing = 20
        
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.cornerRadius = 20
        tabBar.layer.masksToBounds = true
    
    }
    
    private func layout() {
        
    }
    
}
