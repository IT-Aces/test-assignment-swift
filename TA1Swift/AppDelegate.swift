//
//  AppDelegate.swift
//  TA1Swift
//
//  Created by Ivan Manov on 29.03.2021.
//

import Chat
import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        configureUIWindow()
        return true
    }
    
    // MARK: - Private Methods
    
    private func configureUIWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ChatViewController()
        window?.makeKeyAndVisible()
    }
    
}
