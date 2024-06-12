//
//  AcessoryButton.swift
//  Clock
//
//  Created by Jaya Sabeen on 09/06/24.
//

import SwiftUI

struct AcessoryButton: View {
    
    let BtnTitl: String
    
    var body: some View {
        HStack {
            Text(BtnTitl)
                .padding(20)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.btnTitle)
                .background(.mainBG)
                .cornerRadius(25)
                .softOuterShadow(radius: 6)
        }
    }
}

#Preview {
    AcessoryButton(BtnTitl: "On")
}
