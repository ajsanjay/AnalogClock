//
//  LiveClock.swift
//  Clock
//
//  Created by Jaya Sabeen on 07/06/24.
//

import SwiftUI

struct LiveClock: View {
    
    @ObservedObject var ViewModel = DashboardViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                CircleView()
                AnalogClock(borderWidth: 5) { date in
                    ViewModel.currentTime = date
                }
                .padding(20)
            }
        }
    }
}

#Preview {
    LiveClock()
}
