//
//  RadioStation.swift
//  Ground Up Radio
//
//  Created by I AM PR Agency on 3/28/17.
//  Copyright © 2017 Avenir Design. All rights reserved.
//

import UIKit

class RadioStation: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        UIApplication.shared.beginReceivingRemoteControlEvents()
        UINavigationBar.appearance().barStyle = .black
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        UIApplication.shared.endReceivingRemoteControlEvents()
    }

}
