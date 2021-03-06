//
//  TimerManager.swift
//  Hypnos
//
//  Created by Dou Jixiang on 2021/3/4.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    
    var timerMode: TimerMode = .initial
    
    var secondsLeft=60
    
    var timer = Timer()
    
    func start() {
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsLeft == 0 {
                self.timerMode = .initial
                self.secondsLeft = 60
                timer.invalidate()
                
            }
            self.secondsLeft -= 1
        })
    }
}
