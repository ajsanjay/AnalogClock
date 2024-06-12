//
//  Background.swift
//  Clock
//
//  Created by Jaya Sabeen on 07/06/24.
//

import SwiftUI

struct Background: View {
    var body: some View {
        ZStack {
            Color.mainBG
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    Background()
}
