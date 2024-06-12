//
//  LargeText.swift
//  Clock
//
//  Created by Jaya Sabeen on 07/06/24.
//

import SwiftUI

struct LargeText: View {
    
    let content: String
    
    var body: some View {
        Text(content)
            .font(.largeTitle)
            .bold()
            .foregroundColor(.textColour)
    }
}

#Preview {
    LargeText(content: "Large Text")
}
