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
//        tabBarController.viewControllers = viewControllers
        
        return tabBarController
    }
    
//    func createMain(coordinator: MainCoordinator) -> MainViewController {
//        let vc = MainViewController(coordinator: coordinator)
//        vc.tabBarItem.image = UIImage(systemName: "gear.fill")
//        return vc
//    }
//
//    func createProfile(coordinator: ProfileCoordinator) -> ProfileViewController {
//        let vc = ProfileViewController(coordinator: coordinator)
//        vc.tabBarItem.image = UIImage(systemName: "gear.fill")
//        return vc
//    }
//
//    func createCompatibility(coordinator: CompatibilityCoordinator) -> CompatibilityViewController {
//        let vc = CompatibilityViewController(coordinator: coordinator)
//        vc.tabBarItem.image = UIImage(systemName: "gear.fill")
//        return vc
//    }
    
}

class MainBuilder: Builder {
    
    func createMain(coordinator: MainCoordinator) -> MainViewController {
        let vc = MainViewController(coordinator: coordinator)
        vc.tabBarItem.image = UIImage(systemName: "gear")
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
        vc.tabBarItem.image = UIImage(systemName: "gear")
        return vc
    }
    
}

class CompatibilityBuilder: Builder {
    
    func createCompatibility(coordinator: CompatibilityCoordinator) -> CompatibilityViewController {
        let vc = CompatibilityViewController(coordinator: coordinator)
        vc.tabBarItem.image = UIImage(systemName: "gear")
        return vc
    }
    
}
