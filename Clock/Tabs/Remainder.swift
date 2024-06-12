//
//  Remainder.swift
//  Clock
//
//  Created by Jaya Sabeen on 09/06/24.
//

import SwiftUI
import UserNotifications

struct Remainder: View {
    
    @ObservedObject var ViewModel = DashboardViewModel()
    
    var body: some View {
        VStack {
            DefaultHeading(titleStr: "Alarm")
            DefaultSubHeading(titleStr: "Available Alarm")
            Spacer()
            /*Button(action: {
                scheduleAlarm(for: selectedTime)
                isAlarmSet.toggle()
            }) {
                Text(isAlarmSet ? "Alarm Set" : "Set Alarm")
                    .foregroundColor(.white)
                    .padding()
                    .background(isAlarmSet ? Color.green : Color.blue)
                    .cornerRadius(10)
            }
            .padding()*/
            Button(action: {
                
            }) {
                RoundButton(iconImge: "plus")
            }
        }
    }
    
    func scheduleAlarm(for date: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Alarm"
        content.body = "It's time to wake up!"
        content.sound = UNNotificationSound.default
        
        let triggerDate = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            }
        }
    }
}

#Preview {
    Remainder()
}
