//
//  tabButtontype.swift
//  Clock
//
//  Created by Jaya Sabeen on 09/06/24.
//

import SwiftUI

struct tabButtontype: View {
    
    let titleStr: String
    let isSelected: Bool
    
    var body: some View {
        Image(systemName: titleStr)
            .resizable()
            .frame(width: 40, height: 40)
            .fontWeight(.ultraLight)
            .foregroundColor(isSelected == true ? .selectClr : .unSelectSegment)
    }
}

#Preview {
    tabButtontype(titleStr: "clock.badge", isSelected: true)
}
