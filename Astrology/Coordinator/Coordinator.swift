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

enum MainCoordinatorEvent {
    case message, numerology
         
    case pop
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
    
    func eventOccured(_ event: MainCoordinatorEvent) {
        switch event {
        case .message:
            let vc = builder.createMessage(coordinator: self)
            navigationController?.pushViewController(vc, animated: true)
            
        case .numerology:
            let vc = builder.createNumerology(coordinator: self)
            navigationController?.pushViewController(vc, animated: true)
            
        case .pop:
            navigationController?.popViewController(animated: true)
        }
    }
    
}
