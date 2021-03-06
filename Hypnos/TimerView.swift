//
//  SwiftUIView.swift
//  Hypnos
//
//  Created by Dou Jixiang on 2021/3/5.
//


import SwiftUI

struct SwiftUIView: View {
    
    @ObservedObject var timerManager = TimerManager()
    
    @State var selectedPickerIndex = 0
    
    let availableMinutes = Array(1...59)
    var body: some View {
        
        NavigationView {
            
            VStack {
                Text("\(timerManager.secondsLeft)")
                    .font(.system(size:80))
                    .padding(.top, 80)
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:180, height: 180)
                    .foregroundColor(.red)
                    .onTapGesture(perform: {
                        self.timerManager.start()
                    })
                    }
                if timerManager.timerMode == .paused {
                    Image(systemName: "gobackward")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.top, 40)
                }
                
                if timerManager.timerMode == .initial {
                    Picker(selection: $selectedPickerIndex, label:                    Text("")){
                        ForEach(0..<availableMinutes.count) {
                            Text("\(self.availableMinutes[$0]) min")
                        }
                        
                    }
                    .labelsHidden()
                }
                Spacer()
            }
            .navigationBarTitle("Timer")
    }
    
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
