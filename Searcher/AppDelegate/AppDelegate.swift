//
//  AppDelegate.swift
//  Searcher
//
//  Created by Everson Trindade on 28/07/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let homeRouter = HomeRouter()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            window.rootViewController = homeRouter.createHomeModule()
            window.makeKeyAndVisible()
        }
        
        return true
    }


}

