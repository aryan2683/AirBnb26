//
//  AirbnbApp.swift
//  Airbnb
//
//  Created by ARYAN SINGHAL on 06/07/25.
//

import SwiftUI
import FirebaseCore

import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        // Initialize Google Sign-In with your CLIENT_ID
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: "474802816459-6rpukrd9spdhln9ql9snpe8jank4pne2.apps.googleusercontent.com")
        
        return true
    }
}


@main
struct YourApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LogInView()
            }
        }
    }
}
