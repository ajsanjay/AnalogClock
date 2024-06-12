//
//  DefaultSubHeading.swift
//  Clock
//
//  Created by Jaya Sabeen on 09/06/24.
//

import SwiftUI

struct DefaultSubHeading: View {
    
    let titleStr: String
    
    var body: some View {
        HStack {
            Text(titleStr)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.textColour)
                .padding()
            Spacer()
        }
    }
}

#Preview {
    DefaultSubHeading(titleStr: "Sub heading")
}


struct DefaultSubHeadingBg: View {
    
    let titleStr: String
    let isHighlight: Bool
    
    var body: some View {
        HStack {
            Text(titleStr)
                .font(.title2)
                .fontWeight(isHighlight ? .bold : .regular)
                .foregroundColor(.textColour)
        }
    }
}
