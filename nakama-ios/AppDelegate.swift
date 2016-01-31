//
//  AppDelegate.swift
//  nakama-ios
//
//  Created by Andy Wong on 12/23/15.
//  Copyright © 2015 Nakama Project. All rights reserved.
//

import UIKit
import ObjectiveDDP

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let meteorClient = initMeteor("pre2", "ws://localhost:3000/websocket")

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let frame = UIScreen.mainScreen().bounds
        window = UIWindow(frame: frame)
        
        let hpVC = HPViewController(meteorClient: meteorClient)
        window?.rootViewController = hpVC
        window?.makeKeyAndVisible()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportConnection", name: MeteorClientDidConnectNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reportDisconnection", name: MeteorClientDidDisconnectNotification, object: nil)
        
        return true
    }
    
    dynamic private func reportConnection() {
        print("================> connected to server!")
    }
    
    dynamic private func reportDisconnection() {
        print("================> disconnected from server!")
    }

}

