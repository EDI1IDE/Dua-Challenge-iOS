//
//  AppDelegate.swift
//  Dua Challenge
//
//  Created by Muhamed Zahiri on 1.6.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setAppAppearance()
        return true
    }
}

//MARK: - Setup App Appearance
extension AppDelegate {
    
    private func setAppAppearance() {
        let nav = UINavigationBar.appearance()
        nav.isTranslucent = false
        nav.barTintColor = .systemBackground
        nav.tintColor = .systemBlue
        nav.shadowImage = UIImage()
        nav.backIndicatorImage = .backArrow
        nav.backIndicatorTransitionMaskImage = .backArrow
        nav.titleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 18),
            .foregroundColor: UIColor.systemIndigo
        ]
        
        let appearance = UINavigationBarAppearance()
        //Change the backgroundColor of NavBar
        appearance.backgroundColor = .systemBackground
        appearance.shadowColor = .systemBackground
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.systemIndigo,
            .font: UIFont.boldSystemFont(ofSize: 18)
        ]
        appearance.setBackIndicatorImage(.backArrow, transitionMaskImage: .backArrow)

        UINavigationBar().standardAppearance = appearance
        nav.scrollEdgeAppearance = appearance
        nav.standardAppearance = appearance
        
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(.backArrow, for: .normal, barMetrics: .default)
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: 0), for:UIBarMetrics.default)
        UIBarButtonItem.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 17)], for: .normal)
    }
    
}
