//
//  ClockAppAppDeligate.swift
//  Clock
//
//  Created by Jaya Sabeen on 09/06/24.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                // Handle the error here.
                print("Error requesting notification authorization: \(error)")
            }
            // Authorization granted or denied.
            print("Notification permission granted: \(granted)")
        }
        return true
    }
}
