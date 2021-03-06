//
//  TimerView 1.swift
//  Hypnos
//
//  Created by Dou Jixiang on 2021/3/4.
//

import SwiftUI

struct TimerView_1: View {
    
    @State var timerMode: TimerMode = .initial
    @State var selectedPickerIndex = 0
    
    let availableMinutes = Array(1...90)
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("60")
                    .font(.system(size: 80))
                    .padding(.top, 80)
                Image(systemName: timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .foregroundColor(.red)
                if timerMode == .paused {
                    Image(systemName: "gobackward")
                        .aspectRatio(contentMode: .fit)
                        .frame(width:50, height:50)
                        .padding(.top, 40)
                }
                if timerMode == .initial {
                    Picker(selection: $selectedPickerIndex, label: Text ("")) {
                        ForEach(0 ..< availableMinutes.count) {
                            Text("\(self.availableMinutes[$0])min")
                        }
                    }
                    .labelsHidden()
                }
                Spacer()
            }
            .navigationBarTitle("Timer")
    }
        .environment(\.colorScheme, .dark)
}
}

struct TimerView_1_Previews: PreviewProvider {
    static var previews: some View {
        TimerView_1()
    }
}
