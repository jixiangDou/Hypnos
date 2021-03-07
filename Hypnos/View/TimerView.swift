//
//  TimerView 1.swift
//  Hypnos
//
//  Created by Dou Jixiang on 2021/3/4.
//

import SwiftUI

struct TimerView: View {
    
    @ObservedObject var timerManager = TimerManager()
    @EnvironmentObject var bleManager: CoreBluetoothViewModel
    
    @State var selectedPickerIndex = 0
    
    let availableMinutes = [1,5,10,15,30,90,120,240,480,600]
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text(secondsToMinutesAndSeconds(seconds: timerManager.secondsLeft))
                    .font(.system(size: 80))
                    .padding(.top, 80)
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .foregroundColor(.red)
                    .onTapGesture(perform: {
                        if self.timerManager.timerMode == .initial {
                            self.timerManager.setTimerLength(minutes: self.availableMinutes[self.selectedPickerIndex]*60)
                        }
                        self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                    })
                if timerManager.timerMode == .paused {
                    Image(systemName: "gobackward")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.top, 40)
                    .onTapGesture(perform: {
                        self.timerManager.reset()
                    })
                }
                if timerManager.timerMode == .initial {
                    Spacer()
                    HStack {
                        Button(action: {
                            bleManager.writeValue(value: "a")
                        }) {
                            Text("ON")
                        }.frame(width:200,height:20)
                        Button( action: {
                            bleManager.writeValue(value: "b")
                        }) {
                            Text("OFF")
                        }.frame(width:200,height:20)
                        

                    }
                    Picker(selection: $selectedPickerIndex, label: Text("")) {
                        ForEach(0 ..< availableMinutes.count) {
                            Text("\(self.availableMinutes[$0]) min")
                        }
                    }
                    .labelsHidden()
                }
                Spacer()
            }
            .navigationBarTitle("Get a good sleep")
        }
        .environment(\.colorScheme, .dark)
    }

}

struct TimerView_1_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
