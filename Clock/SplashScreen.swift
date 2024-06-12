//
//  SplashScreen.swift
//  Clock
//
//  Created by Jaya Sabeen on 07/06/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var progress = 0.0
    @State private var timer: Timer?
    
    @State var gotoDashboard: Bool = false
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                CircularProgress(progress: progress)
                StatusText(content: "Loading .. ")
            }
        }
        .onAppear() {
            startProgressAnimation()
        }.fullScreenCover(isPresented: $gotoDashboard, content: {
            DashBoard()
        })
    }
    
    private func startProgressAnimation() {
        timer?.invalidate()
        progress = 0.0
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            withAnimation(.linear(duration: 0.05)) {
                progress += 0.01
                if progress >= 1.0 {
                    timer.invalidate()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                        gotoDashboard = true
                    })
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
