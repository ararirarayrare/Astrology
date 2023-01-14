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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if navigationController?.rootViewController != self,
           let tabBarController = tabBarController as? TabBarController,
//           tabBarController.tabBar.alpha == 1 {
           !tabBarController.tabBar.isHidden {
            
//            tabBarController.tabBar.isHidden = true
            tabBarController.hideTabBar()
        }

        if navigationController?.rootViewController == self,
           let tabBarController = tabBarController as? TabBarController,
//           tabBarController.tabBar.alpha == 0 {
           tabBarController.tabBar.isHidden {

//            tabBarController.tabBar.isHidden = false
            tabBarController.showTabBar()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        if navigationController?.rootViewController == self,
//           let tabBarController = tabBarController as? TabBarController,
////           tabBarController.tabBar.alpha == 0 {
//           tabBarController.tabBar.isHidden {
//
////            tabBarController.tabBar.isHidden = false
//            tabBarController.showTabBar()
//        }
    }
    
    func setBackground(image: UIImage?) {
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = image
        imageView.contentMode = .scaleToFill
        view.addSubview(imageView)
    }
    
    func setup() {

    }
    
    func layout() {
        
    }
    
}

class NavigationController: UINavigationController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        navigationBar.prefersLargeTitles = true
        navigationBar.isHidden = true
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [
            .font : UIFont(name: "Copperplate Bold", size: 32) ?? .boldSystemFont(ofSize: 28)
        ]
        appearance.configureWithTransparentBackground()
        
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        
//        interactivePopGestureRecognizer?.addTarget(self, action: #selector(interactivePopRecognized(_:)))
        interactivePopGestureRecognizer?.isEnabled = false
    }
    
//    @objc
//    private func interactivePopRecognized(_ recognizer: UIPanGestureRecognizer) {
//
//        if recognizer.state == .began {
//            tabBarController?.tabBar.isUserInteractionEnabled = false
//        }
//
//        if recognizer.state == .ended {
//            tabBarController?.tabBar.isUserInteractionEnabled = true
//        }
//    }
}
