//
//  CircleView.swift
//  Clock
//
//  Created by Jaya Sabeen on 08/06/24.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    Color(.mainBG)
                )
                .softOuterShadow(radius: 6)
                .padding()
        }
        .padding()
    }
}

#Preview {
    CircleView()
}
