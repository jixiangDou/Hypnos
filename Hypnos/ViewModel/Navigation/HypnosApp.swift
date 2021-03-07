//
//  HypnosApp.swift
//  Hypnos
//
//  Created by George Dou on 2021/02/27.
//

import SwiftUI

@main
struct HypnosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CoreBluetoothViewModel())
        }
    }
}
