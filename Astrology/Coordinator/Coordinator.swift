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

class TabBarCoordinator: Coordinator {
    
    var window: UIWindow?
    
    var navigationController: NavigationController?
    
    var tabBarController: TabBarController?
    
    var childred: [Coordinator]?
    
    let builder: TabBarBuilder
    
    init(window: UIWindow?, builder: TabBarBuilder) {
        self.window = window
        self.builder = builder
    }
    
    func start() {
        let compatibilityCoordinator = CompatibilityCoordinator()
        
        let mainCoordinator = MainCoordinator(window: window,
                                              builder: builder.mainBuilder)
        
        let profileCoordinator = ProfileCoordinator(builder: builder.profileBuilder,
                                                    navigationController: navigationController)
        
        
        let tabBarController = builder.createTabBarController(viewControllers: [])
    }
    
}

class MainCoordinator: Coordinator {
    
    enum Event {
        case message, numerology(Numerology)
        
        case pop
    }
    
    var window: UIWindow?
    
    var navigationController: NavigationController?
    
    var childred: [Coordinator]?
    
    let builder: MainBuilder
    
    init(window: UIWindow?, builder: MainBuilder) {
        self.window = window
        self.builder = builder
    }
    
    func start() {
        let mainViewController = builder.createMain(coordinator: self)
        let navigationController = builder.createNavigation(rootViewController: mainViewController)
        
        self.navigationController = navigationController
        self.window?.rootViewController = navigationController
    }
    
    func eventOccured(_ event: Event) {
        switch event {
        case .message:
            let vc = builder.createMessage(coordinator: self)
            navigationController?.pushViewController(vc, animated: true)
            
        case .numerology(let type):
            let vc = builder.createNumerology(type: type, coordinator: self)
            navigationController?.pushViewController(vc, animated: true)
            
        case .pop:
            navigationController?.popViewController(animated: true)
        }
    }
    
}

class ProfileCoordinator: Coordinator {
    
    enum Event {
        
    }
    
    var window: UIWindow?
    
    var navigationController: NavigationController?
    
    var childred: [Coordinator]?
    
    let builder: ProfileBuiler
    
    init(builder: ProfileBuiler, navigationController: NavigationController?) {
        self.builder = builder
        self.navigationController = navigationController
        self.window = navigationController?.view.window
    }
    
    func start() {

    }
    
    func eventOccured(_ event: Event) {
        
    }
    
}

class CompatibilityCoordinator: Coordinator {
    
    enum Event {
        
    }
    
    var window: UIWindow?
    
    var navigationController: NavigationController?
    
    var childred: [Coordinator]?
    
    func start() {
        
    }
    
    func eventOccured(_ event: Event) {
        
    }
    
}
