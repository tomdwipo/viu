//
//  SceneDelegate.swift
//  viu
//
//  Created by Tommy-amarbank on 16/08/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let uiWindow = (scene as? UIWindowScene) else { return }
        self.window?.windowScene = uiWindow
        self.window?.rootViewController = MainCoordinator.main()
        self.window?.makeKeyAndVisible()
    }
}

