//
//  Helper.swift
//  Hypnos
//
//  Created by Dou Jixiang on 2021/3/5.
//

import Foundation

enum TimerMode {
    case running
    case paused
    case initial
}

func secondsToMinutesAndSeconds(seconds: Int) -> String {
    let hours = "\(seconds / 3600)"
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    let hourStamp = hours.count > 1 ? hours : "0" + hours
    let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
    let secondStamp = seconds.count > 1 ? seconds : "0" + seconds
    if hours == "0" {
        return "\(minuteStamp) : \(secondStamp)"
    } else {
        return "\(hourStamp): \(minuteStamp) : \(secondStamp)"
        
    }
}
