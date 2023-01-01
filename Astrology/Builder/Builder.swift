//
//  Builder.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class Builder {
    
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
    
    func createNumerology(coordinator: MainCoordinator) -> NumerologyViewController {
        let vc = NumerologyViewController(coordinator: coordinator)
        return vc
    }
}
