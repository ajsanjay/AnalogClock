//
//  DashboardViewModel.swift
//  Clock
//
//  Created by Jaya Sabeen on 12/06/24.
//

import Foundation

class DashboardViewModel: ObservableObject {
    
    @Published var TabMenu: ClockOption = .Remainder
    @Published var isAddAlarm: Bool = false
    @Published var selectedTime = Date()
    @Published var currentTime: Date = Date.now
    
    // For Setup Alarm
    @Published var alarmTime = Date()
    @Published var showPicker: Bool = false
    @Published var hour: Int = 12
    @Published var minitues: Int = 0
    @Published var changeToMin: Bool = false
    @Published var symbol: String = "AM"
    @Published var angle: Double = 0
}
