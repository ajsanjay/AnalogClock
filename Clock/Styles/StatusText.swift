//
//  StatusText.swift
//  Clock
//
//  Created by Jaya Sabeen on 07/06/24.
//

import SwiftUI

struct StatusText: View {
    
    let content: String
    
    var body: some View {
        Text(content)
            .font(.title)
            .foregroundColor(.textColour)
    }
}

#Preview {
    StatusText(content: "Loading..")
}
