//
//  DefaultHeading.swift
//  Clock
//
//  Created by Jaya Sabeen on 09/06/24.
//

import SwiftUI

struct DefaultHeading: View {
    
    let titleStr: String
    
    var body: some View {
        HStack {
            Text(titleStr)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.textColour)
                .padding()
            Spacer()
        }
    }
}

#Preview {
    DefaultHeading(titleStr: "Heading")
}

struct DefaultHeadingBg: View {
    
    let titleStr: String
    let isHighlight: Bool
    
    var body: some View {
        HStack {
            Text(titleStr)
                .font(.title)
                .fontWeight(isHighlight ? .heavy : .regular)
                .foregroundColor(.textColour)
        }
    }
}
