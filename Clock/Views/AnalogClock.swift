//
//  AnalogClock.swift
//  Clock
//
//  Created by Jaya Sabeen on 08/06/24.
//

import SwiftUI

struct AnalogClock: View {
    
    let borderWidth: CGFloat
    @State private var currentTime: Date = Date.now
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    typealias AnalogCallBack = (Date)-> Void
    var onUpdateTime: AnalogCallBack? = nil
    
    var body: some View {
        GeometryReader { geometry in
            
            let radius = geometry.size.width / 2
            let innerRadius = radius - borderWidth
            
            let centerX = radius
            let centerY = geometry.size.height / 2
            let center = CGPoint(x: centerX, y: centerY)
            
            let components = Calendar.current.dateComponents([.hour, .minute, .second], from: currentTime)
            
            let hour = components.hour ?? 0
            let minute = components.minute ?? 0
            let second = components.second ?? 0
            
            ZStack {
                drawBackgroundCircles(borderWidth: borderWidth)
                drawClockTicks(centerX: centerX, centerY: centerY, innerRadius: innerRadius)
                drawClockHands(hour: hour, minute: minute, second: second, centerX: centerX, centerY: centerY, innerRadius: innerRadius)
                drawCenterCircle(center: center)
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .padding(30)
        .onReceive(timer) { time in
            currentTime = time
            onUpdateTime?(time)
        }
    }
    
    private func drawBackgroundCircles(borderWidth: CGFloat) -> some View {
        ZStack {
            Circle()
                .foregroundColor(.deselectBg)
            
            Circle()
                .foregroundColor(.mainBG)
                .padding(borderWidth)
        }
    }
    
    private func drawClockTicks(centerX: CGFloat, centerY: CGFloat, innerRadius: CGFloat) -> some View {
        ZStack {
            Path { path in
                for i in 0..<60 {
                    let radian = Angle(degrees: Double(i) * 6 - 90).radians
                    let lineHeight: CGFloat = i % 5 == 0 ? 25 : 10
                    let x1 = centerX + innerRadius * cos(radian)
                    let y1 = centerY + innerRadius * sin(radian)
                    let x2 = centerX + (innerRadius - lineHeight) * cos(radian)
                    let y2 = centerY + (innerRadius - lineHeight) * sin(radian)
                    path.move(to: .init(x: x1, y: y1))
                    path.addLine(to: .init(x: x2, y: y2))
                }
            }
            .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round))
            .foregroundColor(.selectClr)
            
            ForEach(1..<13) { i in
                let angle = Angle(degrees: Double(i) * 30 - 90).radians
                let x = centerX + (innerRadius - 40) * cos(angle)
                let y = centerY + (innerRadius - 40) * sin(angle)
                Text("\(i)")
                    .font(.system(size: 16))
                    .position(x: x, y: y)
            }
        }
    }
    
    private func drawCenterCircle(center: CGPoint) -> some View {
        Circle()
            .frame(width: 10, height: 10)
            .foregroundColor(.selectClr)
            .position(center)
    }
    
    private func drawClockHands(hour: Int, minute: Int, second: Int, centerX: CGFloat, centerY: CGFloat, innerRadius: CGFloat) -> some View {
        ZStack {
            drawHand(length: innerRadius * 0.75, angle: Angle.degrees(Double(second * 6 - 90)), centerX: centerX, centerY: centerY, color: .selectClr, lineWidth: 1.0)
            drawHand(length: innerRadius * 0.65, angle: Angle.degrees(Double(minute * 6 - 90)), centerX: centerX, centerY: centerY, color: .textColour, lineWidth: 2.0)
            drawHand(length: innerRadius * 0.5, angle: Angle.degrees(Double(hour * 30 - 90)), centerX: centerX, centerY: centerY, color: .textColour, lineWidth: 4.0)
        }
    }
    
    private func drawHand(length: CGFloat, angle: Angle, centerX: CGFloat, centerY: CGFloat, color: Color, lineWidth: CGFloat) -> some View {
        Path { path in
            let radian = angle.radians
            let x1 = centerX + length * cos(radian)
            let y1 = centerY + length * sin(radian)
            let x2 = centerX - 15 * cos(radian)
            let y2 = centerY - 15 * sin(radian)
            path.move(to: CGPoint(x: x2, y: y2))
            path.addLine(to: CGPoint(x: x1, y: y1))
        }
        .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
        .foregroundColor(color)
    }
}

#Preview {
    AnalogClock(borderWidth: 20.0)
}
