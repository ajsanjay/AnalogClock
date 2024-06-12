//
//  ClockApp.swift
//  Clock
//
//  Created by Jaya Sabeen on 07/06/24.
//

import SwiftUI

@main
struct ClockApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}
