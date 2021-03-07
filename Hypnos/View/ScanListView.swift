//
//  ScanListView.swift
//  Hypnos
//
//  Created by 窦勇伟 on 2021/03/07.
//

import SwiftUI

struct ScanListView: View {
    @EnvironmentObject var bleManager: CoreBluetoothViewModel

    var body: some View {
        VStack {
//            NavigationLink("", destination: ScanDetailView(isRootViewActive: $bleManager.isConnected),
//                           isActive: $bleManager.isConnected)
            
            Button(action: {
                if bleManager.isSearching {
                    bleManager.stopScan()
                } else {
                    bleManager.startScan()
                }
            }) {
                UIButtonView(text: bleManager.isSearching ? "Stop scan" : "Start scan")
            }
            
            Text(bleManager.isBlePower ? "" : "To set Bluetooth on in system settings")
                .padding(10)
            
            PeripheralCells()
       
            .navigationBarTitle("Hypnos")
        }
    }
    
    struct UIButtonView: View {
        var text: String
        
        var body: some View {
            Text(text)
                .frame(width: 350, height: 50, alignment: .center)
                .foregroundColor(Color.blue)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2))
        }
    }
    
    struct PeripheralCells: View {
        @EnvironmentObject var bleManager: CoreBluetoothViewModel
        
        var body: some View {
            List {
                ForEach(0..<bleManager.foundPeripherals.count, id: \.self) { num in
                    Button(action: {
                        bleManager.connectPeripheral(bleManager.foundPeripherals[num])
                    }) {
                        HStack {
                            Text("\(bleManager.foundPeripherals[num].name)")
                            Spacer()
                            Text("\(bleManager.foundPeripherals[num].rssi) dBm")
                        }
                    }
                }
            }
        }
    }
}
