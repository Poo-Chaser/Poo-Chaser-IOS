//
//  AppDelegate.swift
//  poochaser
//
//  Created by 판근 on 2020/08/12.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    var paramTime: String?
    var paramKind: String?
    var paramColor: String?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        let firstViewController = LoginViewController()
//        let navigationController = UINavigationController(rootViewController: firstViewController)
//        navigationController.navigationItem.title = "Poo Chaser"
//        window?.rootViewController = navigationController
        
//        let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
//        let nvc = UINavigationController(rootViewController: vc)
//
//        self.window?.rootViewController = nvc
//        window?.makeKeyAndVisible()
        
        FirebaseApp.configure()
        let db = Firestore.firestore()
        print(db)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

