//
//  TabBarController.swift
//  DePelis
//
//  Created by Mario Vargas on 12/11/24.
//

import UIKit
import CoreData

class TabBarController: UITabBarController {
    var managedObject: NSManagedObjectContext!
    
    
    var InitView: (UIViewController&ProtocolInitViewController)!
    var FavoritesView: (UIViewController&ProtocolFavoritesView)!
    
    lazy public var SettingsView: UIViewController = {
        let settingsView = SettingsViewController()
        let title = Strings.TabBar.settingsTitle
        let defaultImage = UIImage(systemName: Strings.Icons.gearshapeIcon)
        let selectedImage = UIImage(systemName: Strings.Icons.gearshapefillIcon)
        let tabBarItems = (title: title, image: defaultImage, selectedImage: selectedImage)
        let tabBarItem = UITabBarItem(title: tabBarItems.title, image: tabBarItems.image, selectedImage: tabBarItems.selectedImage)
        settingsView.tabBarItem = tabBarItem
        return settingsView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().backgroundColor = .colorTabBar
        tabBar.tintColor = .tintColorTab
        tabBar.unselectedItemTintColor = .lightGray
        createFavoriteView()
        createInitView()
        setupVCs()
    }
    override func viewDidAppear(_ animated: Bool) {
        FavoritesView.managedObject = self.managedObject
        InitView.managedObject = self.managedObject
    }
    
    func createFavoriteView() {
        let favoritesRouter = FavoritesRouter.start()
        FavoritesView = favoritesRouter.view
        let title = Strings.TabBar.favoriteTitle
        let defaultImage = UIImage(systemName: Strings.Icons.starIcon)
        let selectedImage = UIImage(systemName: Strings.Icons.starfillIcon)
        let tabBarItems = (title: title, image: defaultImage, selectedImage: selectedImage)
        let tabBarItem = UITabBarItem(title: tabBarItems.title, image: tabBarItems.image, selectedImage: tabBarItems.selectedImage)
        FavoritesView.tabBarItem = tabBarItem
    }
    
    func createInitView() {
        let initRouter = InitViewRouter.start()
        InitView = initRouter.view
        let title = Strings.TabBar.initTitle
        let defaultImage = UIImage(systemName: Strings.Icons.houseIcon)
        let selectedImage = UIImage(systemName: Strings.Icons.housefillIcon)
        let tabBarItems = (title: title, image: defaultImage, selectedImage: selectedImage)
        let tabBarItem = UITabBarItem(title: tabBarItems.title, image: tabBarItems.image, selectedImage: tabBarItems.selectedImage)
        InitView.tabBarItem = tabBarItem
    }
    
    func setupVCs() {
        viewControllers = [
            InitView,
            FavoritesView,
            SettingsView,
        ]
    }
    
    
}
