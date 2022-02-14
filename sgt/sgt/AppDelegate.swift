//
//  AppDelegate.swift
//  sgt
//
//  Created by Christian Riccio on 09/02/22.
//

import UIKit
import Foundation
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        MainViewController().viewWillAppear(true)
        return true
    }
}
