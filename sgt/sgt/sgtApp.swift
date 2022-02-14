//
//  sgtApp.swift
//  sgt
//
//  Created by Christian Riccio on 08/02/22.
//

import SwiftUI
import UIKit


@main
struct sgtApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            homeScreen()
//            HomeView()
            LoginView(primaryColor: .systemBlue, secondaryColor: .systemOrange)
            
            
        }
    }
}
