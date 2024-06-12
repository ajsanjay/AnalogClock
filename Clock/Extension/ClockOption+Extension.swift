//
//  ClockOption+Extension.swift
//  Clock
//
//  Created by Jaya Sabeen on 09/06/24.
//

import Foundation

extension ClockOption {
    var iCons: String {
        switch self {
        case .Remainder:
            return "clock.badge"
        case .LiveClock:
            return "clock"
        case .StopWatch:
            return "stopwatch"
        case .CountDown:
            return "hourglass.bottomhalf.filled"
        }
    }
}
