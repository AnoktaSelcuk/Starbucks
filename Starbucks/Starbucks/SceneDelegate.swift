//
//  SceneDelegate.swift
//  Starbucks
//
//  Created by Alperen Selçuk on 18.02.2022.
//  Copyright © 2022 Alperen Selçuk. All rights reserved.
//

import UIKit

class StarBucksViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let configuration   = UIImage.SymbolConfiguration(scale: .large)
        let image           = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem          = UITabBarItem(title: title, image: image, tag: 0)
    }
}

class ScanViewController: StarBucksViewController {
    override func viewDidLoad() {
        view.backgroundColor    = .systemIndigo
        title                   = "Scan"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "qrcode", title: "Scan")
    }
}

class OrderViewController: StarBucksViewController {
    override func viewDidLoad() {
        view.backgroundColor    = .systemOrange
        title                   = "Order"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "arrow.up.bin.fill", title: "Order")
    }
}

class GiftViewController: StarBucksViewController {
    override func viewDidLoad() {
        view.backgroundColor    = .systemGreen
        title                   = "Gift"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "gift.fill", title: "Gift")
    }
}

class StoreViewControllers: StarBucksViewController {
    override func viewDidLoad() {
        view.backgroundColor    = .systemTeal
        title                   = "Store"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "location.fill", title: "Stores")
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene         = windowScene
        window?.backgroundColor     = .systemBackground
        window?.makeKeyAndVisible()
        
        let homeVC  = HomeViewController()
        let scanVC  = ScanViewController()
        let orderVC = OrderViewController()
        let giftVC  = GiftViewController()
        let storeVC = StoreViewControllers()
                
        let scanNC  = UINavigationController(rootViewController: scanVC)
        let orderNC = UINavigationController(rootViewController: orderVC)
        let giftNC  = UINavigationController(rootViewController: giftVC)
        let storeNC = UINavigationController(rootViewController: storeVC)
        
        let tabBarControllers = UITabBarController()
        tabBarControllers.viewControllers = [homeVC, scanNC, orderNC, giftNC, storeNC]
        
        tabBarControllers.tabBar.tintColor      = .lightGreen
        tabBarControllers.tabBar.isTranslucent  = false //bu ne bilmiyorum..
        
        window?.rootViewController  = tabBarControllers
    }

}


