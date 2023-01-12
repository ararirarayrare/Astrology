//
//  Builder.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class TabBarBuilder {
    
    let mainBuilder = MainBuilder()
    
    let compatibilityBuilder = CompatibilityBuilder()
    
    let profileBuilder = ProfileBuiler()
    
    func createMain(coordinator: MainCoordinator) -> MainViewController {
        let vc = MainViewController(coordinator: coordinator)
        return vc
    }
    
    func createProfile(coordinator: ProfileCoordinator) -> ProfileViewController {
        let vc = ProfileViewController(coordinator: coordinator)
        return vc
    }
    
    func createCompatibility(coordinator: CompatibilityCoordinator) -> CompatibilityViewController {
        let vc = CompatibilityViewController(coordinator: coordinator)
        return vc
    }
    
    func createTabBarController(viewControllers: [ViewController]) -> TabBarController {
        let tabBarController = TabBarController()
        tabBarController.viewControllers = viewControllers
        
        return tabBarController
    }
}

class MainBuilder {
    
    func createNavigation(rootViewController: ViewController) -> NavigationController {
        return NavigationController(rootViewController: rootViewController)
    }
    
    func createMain(coordinator: MainCoordinator) -> MainViewController {
        let vc = MainViewController(coordinator: coordinator)
        return vc
    }
    
    func createMessage(coordinator: MainCoordinator) -> MessageViewController {
        let vc = MessageViewController(coordinator: coordinator)
        return vc
    }
    
    func createNumerology(type: Numerology, coordinator: MainCoordinator) -> NumerologyViewController {
        let vc = NumerologyViewController(numerologyType: type, coordinator: coordinator)
        return vc
    }

}

class ProfileBuiler {
    

    
}

class CompatibilityBuilder {
    
    
}
