//
//  DashBoard.swift
//  Clock
//
//  Created by Jaya Sabeen on 09/06/24.
//

import SwiftUI

struct DashBoard: View {
    
    @StateObject var ViewModel = DashboardViewModel()
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                HStack {
                    ForEach(ClockOption.allCases, id: \.self) { tab in
                        Spacer()
                        Button(action: {
                            ViewModel.TabMenu = tab
                        }) {
                            tabButtontype(titleStr: tab.iCons, isSelected: ViewModel.TabMenu.iCons == tab.iCons ? true : false)
                        }
                        Spacer()
                    }
                }
                .padding()
                Spacer()
                VStack {
                    switch ViewModel.TabMenu {
                    case .Remainder:
                        Remainder()
                    case .LiveClock:
                        LiveClock()
                    case .StopWatch:
                        StopWatch()
                    case .CountDown:
                        CountDown()
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    DashBoard()
}
