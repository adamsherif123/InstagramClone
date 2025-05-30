//
//  AirbnbCloneApp.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 6/21/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct AirbnbCloneApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
     
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
