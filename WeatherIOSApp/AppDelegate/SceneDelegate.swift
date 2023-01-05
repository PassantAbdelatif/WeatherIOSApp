//
//  SceneDelegate.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 03/01/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        self.setRootViewController(scene: scene)
        guard let _ = (scene as? UIWindowScene) else { return }
    }



}

extension SceneDelegate {
    func setRootViewController(scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let navigationController = UINavigationController()
        navigationController.viewControllers = [WeatherForecastViewController()]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
