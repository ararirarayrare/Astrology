//
//  Coordinator.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

protocol Coordinator {
    
    var window: UIWindow? { get }
    
    var navigationController: NavigationController? { get }
    
    var childred: [Coordinator]? { get }
        
    func start()
    
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}

class MainCoordinator: Coordinator {
    
    var window: UIWindow?
    
    var navigationController: NavigationController?
    
    var childred: [Coordinator]?
    
    let builder: Builder
    
    init(window: UIWindow?, builder: Builder) {
        self.window = window
        self.builder = builder
    }
    
    func start() {
        let mainViewController = builder.createMain(coordinator: self)
        let navigationController = builder.createNavigation(rootViewController: mainViewController)
        
        self.navigationController = navigationController
        self.window?.rootViewController = navigationController
    }
    
    
}
