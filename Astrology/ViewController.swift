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
        
        tabBarController?.tabBar.isHidden = !(navigationController?.rootViewController == self)
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
