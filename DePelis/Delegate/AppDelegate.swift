//
//  AppDelegate.swift
//  DePelis
//
//  Created by Mario Vargas on 12/11/24.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var coreData = CoreDataManager(modelName: Strings.CoreData.modelName)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigation = UINavigationController(rootViewController: LoginRouter.start(managedObject: coreData.managedContext).view! )
        navigation.isNavigationBarHidden = true
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print(Strings.General.EnterBackGround)
        coreData.saveContext()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print(Strings.General.WillTerminate)
        coreData.saveContext()
    }

}

