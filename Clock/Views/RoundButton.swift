//
//  RoundButton.swift
//  Clock
//
//  Created by Jaya Sabeen on 12/06/24.
//

import SwiftUI

struct RoundButton: View {
    
    let iconImge: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.mainBG)
                .frame(width: 70, height: 70)
                .overlay(content: {
                    Image(systemName: iconImge)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.textColour)
                        .fontWeight(.light)
                })
                .softOuterShadow(radius: 6)
        }
    }
}

#Preview {
    RoundButton(iconImge: "plus")
}
