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
    
    let mainBuilder = HomeBuilder()
    
    let compatibilityBuilder = CompatibilityBuilder()
    
    let profileBuilder = ProfileBuiler()
    
    func createTabBarController(viewControllers: [UIViewController]) -> TabBarController {
        let tabBarController = TabBarController(viewControllers: viewControllers)
        
        return tabBarController
    }
    
}

class HomeBuilder: Builder {
    
    func createHome(coordinator: HomeCoordinator) -> HomeViewController {
        let vc = HomeViewController(coordinator: coordinator)

        let tabBarItem = UITabBarItem(title: "Home",
                                      image: Icon.home,
                                      selectedImage: Icon.homeSelected)
        
        vc.tabBarItem = tabBarItem
        
        return vc
    }
    
    func createMessage(coordinator: HomeCoordinator) -> MessageViewController {
        let vc = MessageViewController(coordinator: coordinator)
        return vc
    }
    
    func createNumerology(type: Numerology, coordinator: HomeCoordinator) -> NumerologyViewController {
        let vc = NumerologyViewController(numerologyType: type, coordinator: coordinator)
        return vc
    }

}

class ProfileBuiler: Builder {
    
    func createProfile(coordinator: ProfileCoordinator) -> ProfileViewController {
        let vc = ProfileViewController(coordinator: coordinator)
        
        let tabBarItem = UITabBarItem(title: "Profile",
                                      image: Icon.profile,
                                      selectedImage: Icon.profileSelected)
        
        vc.tabBarItem = tabBarItem
        
        return vc
    }
    
    func createEditProfile(coordinator: ProfileCoordinator) -> EditProfileViewController {
        let vc = EditProfileViewController(coordinator: coordinator)
        return vc
    }
    
    func createHelp(coordinator: ProfileCoordinator) -> HelpViewController {
        let vc = HelpViewController(coordinator: coordinator)
        return vc
    }
    
}

class CompatibilityBuilder: Builder {
    
    func createCompatibility(coordinator: CompatibilityCoordinator) -> CompatibilityViewController {
        let vc = CompatibilityViewController(coordinator: coordinator)
        
        let tabBarItem = UITabBarItem(title: "Match",
                                      image: Icon.match,
                                      selectedImage: Icon.matchSelected)
        
        vc.tabBarItem = tabBarItem
        
        
        return vc
    }
    
}
