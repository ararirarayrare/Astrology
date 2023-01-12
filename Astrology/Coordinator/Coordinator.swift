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
//        let tabBarController = builder.createTabBarController()
//
//        let compatibilityCoordinator = CompatibilityCoordinator(builder: builder.compatibilityBuilder,
//                                                                tabBarController: tabBarController)
//
//        let mainCoordinator = MainCoordinator(builder: builder.mainBuilder,
//                                              tabBarController: tabBarController)
//
//        let profileCoordinator = ProfileCoordinator(builder: builder.profileBuilder,
//                                                    tabBarController: tabBarController)
        
//        compatibilityCoordinator.start()
//        mainCoordinator.start()
//        profileCoordinator.start()
        
        let compatibilityCoordinator = CompatibilityCoordinator(builder: builder.compatibilityBuilder)
        
        let mainCoordinator = MainCoordinator(builder: builder.mainBuilder)
        
        let profileCoordinator = ProfileCoordinator(builder: builder.profileBuilder)
        
        compatibilityCoordinator.start()
        mainCoordinator.start()
        profileCoordinator.start()
        
        if let compatibilityVc = compatibilityCoordinator.navigationController,
           let mainVc = mainCoordinator.navigationController,
           let profileVc = profileCoordinator.navigationController {
            
            let tabBarController = builder.createTabBarController(
                viewControllers: [
                    compatibilityVc,
                    mainVc,
                    profileVc
                ]
            )
            
            self.tabBarController = tabBarController
        }
        
        window?.rootViewController = tabBarController
    }
    
}

class MainCoordinator: Coordinator {
    
    enum Event {
        case message, numerology(Numerology)
        
        case pop
    }
    
    var window: UIWindow?
    
    var navigationController: NavigationController?
    
    var tabBarController: TabBarController?
    
    var childred: [Coordinator]?
    
    let builder: MainBuilder
    
    init(builder: MainBuilder) {
        self.builder = builder
//        self.tabBarController = tabBarController
        
        self.window = tabBarController?.view.window
    }
    
    func start() {
        let vc = builder.createMain(coordinator: self)
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
