//
//  SetupAlarm.swift
//  Clock
//
//  Created by Jaya Sabeen on 09/06/24.
//

import SwiftUI

struct SetupAlarm: View {
    
    @StateObject var ViewModel = DashboardViewModel()
    
    var body: some View {
        ZStack {
            Text(ViewModel.alarmTime, style: .time)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.textColour)
                .onTapGesture {
                    withAnimation(.spring(), {
                        ViewModel.showPicker.toggle()
                    })
                }
            
            if ViewModel.showPicker {
                VStack {
                    HStack (spacing: 15) {
                        Spacer()
                        HStack (spacing: 0) {
                            DefaultHeadingBg(titleStr: "\(ViewModel.hour):", isHighlight: ViewModel.changeToMin ? false : true)
                                .onTapGesture {
                                    ViewModel.angle = Double(ViewModel.hour * 30)
                                    ViewModel.changeToMin = false
                                }
                            DefaultHeadingBg(titleStr: "\(ViewModel.minitues < 10 ? "0" : "")\(ViewModel.minitues)", isHighlight: ViewModel.changeToMin ? true : false)
                                .onTapGesture {
                                    ViewModel.angle = Double(ViewModel.minitues * 6)
                                    ViewModel.changeToMin = true
                                }
                        }
                        VStack (spacing: 8) {
                            DefaultSubHeadingBg(titleStr: "AM", isHighlight: ViewModel.symbol == "AM" ? true : false)
                                .onTapGesture {
                                    ViewModel.symbol = "AM"
                                }
                            DefaultSubHeadingBg(titleStr: "PM", isHighlight: ViewModel.symbol == "PM" ? true : false)
                                .onTapGesture {
                                    ViewModel.symbol = "PM"
                                }
                        }
                        .frame(width: ScreenWidth * 0.1)
                    }
                    .padding()
                    .foregroundColor(.textColour)
                    TimeSliderView()
                }
                .frame(width: ScreenWidth * 0.85)
                .background(.bGcolor)
                .cornerRadius(15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onTapGesture {
                    withAnimation(.spring()) {
                        ViewModel.showPicker.toggle()
                        ViewModel.changeToMin = false
                    }
                }
                .softOuterShadow(radius: 6.0)
                .environmentObject(ViewModel)
            }
        }
    }
}


#Preview {
    SetupAlarm()
}

struct TimeSliderView: View {
    
    @EnvironmentObject var ViewModel: DashboardViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                let clockWidth = geometry.frame(in: .global).width / 2
                
                Circle()
                    .fill(.selectClr)
                    .frame(width: 60)
                    .offset(x: clockWidth - 40)
                    .rotationEffect(.init(degrees: ViewModel.angle))
                    .gesture(DragGesture().onChanged(onChangeBegin(value:))
                        .onEnded(onChangeEnd(value:))
                    )
                    .rotationEffect(.init(degrees: -90))
                
                ForEach(1...12, id: \.self) { index in
                    VStack {
                        Text("\(ViewModel.changeToMin ? index * 5 : index)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.textColour)
                            .rotationEffect(.init(degrees: Double(-index) * 30))
                    }
                    .offset(y: -(clockWidth - 40))
                    .rotationEffect(.init(degrees: Double(index) * 30))
                }
                
                Circle()
                    .fill(.selectClr)
                    .frame(width: 10)
                    .overlay(
                        Rectangle()
                            .fill(.selectClr)
                            .frame(width: 2, height: clockWidth * 0.65)
                        ,alignment: .bottom
                    )
                    .rotationEffect(.init(degrees: ViewModel.angle))
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: ScreenHeight * 0.4)
    }
    
    func onChangeBegin(value: DragGesture.Value) {
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        let radians = atan2(vector.dy - 20, vector.dx - 20)
        var angle = radians * 180 / .pi
        ViewModel.angle = Double(angle)
        if !ViewModel.changeToMin {
            ViewModel.angle = Double(30 * Int(round(angle / 30)))
        } else {
            let progress = ViewModel.angle / 360
            ViewModel.minitues = Int(progress * 60)
        }
        
    }
    
    func onChangeEnd(value: DragGesture.Value) {
        if !ViewModel.changeToMin {
            ViewModel.hour = Int(ViewModel.angle / 30)
            withAnimation {
                ViewModel.angle = Double(ViewModel.minitues * 6)
                ViewModel.changeToMin = true
            }
        }
    }
    
}
