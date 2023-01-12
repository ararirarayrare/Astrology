//
//  Builder.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class Builder {
    func createNavigationController(rootViewController: ViewController) -> NavigationController {
        return NavigationController(rootViewController: rootViewController)
    }
}

class TabBarBuilder: Builder {
    
    let mainBuilder = MainBuilder()
    
    let compatibilityBuilder = CompatibilityBuilder()
    
    let profileBuilder = ProfileBuiler()
    
    func createTabBarController(viewControllers: [UIViewController]) -> TabBarController {
        let tabBarController = TabBarController(viewControllers: viewControllers)
        return tabBarController
    }
    
}

class MainBuilder: Builder {
    
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

class ProfileBuiler: Builder {
    
    func createProfile(coordinator: ProfileCoordinator) -> ProfileViewController {
        let vc = ProfileViewController(coordinator: coordinator)
        return vc
    }
    
}

class CompatibilityBuilder: Builder {
    
    func createCompatibility(coordinator: CompatibilityCoordinator) -> CompatibilityViewController {
        let vc = CompatibilityViewController(coordinator: coordinator)
        return vc
    }
    
}
