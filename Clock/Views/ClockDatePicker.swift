//
//  ClockDatePicker.swift
//  Clock
//
//  Created by Jaya Sabeen on 09/06/24.
//

import SwiftUI

struct ClockDatePicker: View {
    
    @Binding var selectedDates: Set<DateComponents>
    @Binding var hideCalender: Bool
    
    var body: some View {
        VStack {
            MultiDatePicker("Select Days", selection: $selectedDates)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .padding(.bottom, 10)
                .frame(height: 330)
        }
    }
}

#Preview {
    ClockDatePicker(selectedDates: .constant([]), hideCalender: .constant(false))
}
