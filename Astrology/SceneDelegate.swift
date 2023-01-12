//
//  SceneDelegate.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit
import SafariServices


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.overrideUserInterfaceStyle = .dark
        window?.makeKeyAndVisible()
        
        let builder = MainBuilder()
        let mainCoordinator = MainCoordinator(window: window, builder: builder)

        mainCoordinator.start()
    }

}

