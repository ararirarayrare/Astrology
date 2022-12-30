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
    
    func createMain(coordinator: Coordinator?) -> MainViewController {
        let vc = MainViewController(coordinator: coordinator)
        return vc
    }
    
    func createMessage(coordinator: Coordinator?) -> MessageViewController {
        let vc = MessageViewController(coordinator: coordinator)
        return vc
    }
}
