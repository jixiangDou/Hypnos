//
//  ContentView.swift
//  Hypnos
//
//  Created by 窦勇伟 on 2021/03/07.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var bleManager: CoreBluetoothViewModel
    
    var body: some View {
        ZStack{

            if !bleManager.isConnected {
                ScanListView()

            } else {
                VStack {
                    TimerView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello world!")
    }
}
