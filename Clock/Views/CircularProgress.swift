//
//  CircularProgress.swift
//  Clock
//
//  Created by Jaya Sabeen on 07/06/24.
//

import SwiftUI

struct CircularProgress: View {
    var progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(.deselectBg)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.selectClr)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
            LargeText(content: String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
        }
        .padding(20)
    }
}


#Preview {
    CircularProgress(progress: 0.1)
}
