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
    
    var tabBarController: TabBarController? { get }
    
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
        let compatibilityCoordinator = CompatibilityCoordinator(builder: builder.compatibilityBuilder)
        
        let homeCoordinator = HomeCoordinator(builder: builder.mainBuilder)
        
        let profileCoordinator = ProfileCoordinator(builder: builder.profileBuilder)
        
        compatibilityCoordinator.start()
        homeCoordinator.start()
        profileCoordinator.start()
        
        if let compatibilityVc = compatibilityCoordinator.navigationController,
           let homeVc = homeCoordinator.navigationController,
           let profileVc = profileCoordinator.navigationController {
            
            let tabBarController = builder.createTabBarController(
                viewControllers: [
                    compatibilityVc,
                    homeVc,
                    profileVc
                ]
            )
            
            self.tabBarController = tabBarController
        }
        
        window?.rootViewController = tabBarController
    }
    
}

class HomeCoordinator: Coordinator {
    
    enum Event {
        case message, numerology(Numerology)
        
        case pop
    }
    
    var window: UIWindow?
    
    var navigationController: NavigationController?
    
    var tabBarController: TabBarController?
    
    var childred: [Coordinator]?
    
    let builder: HomeBuilder
    
    init(builder: HomeBuilder) {
        self.builder = builder
//        self.tabBarController = tabBarController
        
        self.window = tabBarController?.view.window
    }
    
    func start() {
        let vc = builder.createHome(coordinator: self)
        let navController = builder.createNavigationController(rootViewController: vc)
        
        self.navigationController = navController
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
    
    var tabBarController: TabBarController?
    
    var childred: [Coordinator]?
    
    let builder: ProfileBuiler
    
    init(builder: ProfileBuiler) {
        self.builder = builder
//        self.tabBarController = tabBarController
        
        self.window = tabBarController?.view.window
    }
    
    func start() {
        let vc = builder.createProfile(coordinator: self)
        let navController = builder.createNavigationController(rootViewController: vc)

        self.navigationController = navController
    }
    
    func eventOccured(_ event: Event) {
        
    }
    
}

class CompatibilityCoordinator: Coordinator {
    
    enum Event {
        
    }
    
    var window: UIWindow?
    
    var navigationController: NavigationController?
    
    var tabBarController: TabBarController?
    
    var childred: [Coordinator]?
    
    let builder: CompatibilityBuilder
    
    init(builder: CompatibilityBuilder) {
        self.builder = builder
//        self.tabBarController = tabBarController
        
        self.window = tabBarController?.view.window
    }
    
    func start() {
        let vc = builder.createCompatibility(coordinator: self)
        let navController = builder.createNavigationController(rootViewController: vc)

        self.navigationController = navController
    }
    
    func eventOccured(_ event: Event) {
        
    }
    
}
