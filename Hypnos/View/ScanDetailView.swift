//
//  ScanDetailView.swift
//  Hypnos
//
//  Created by 窦勇伟 on 2021/03/07.
//

import SwiftUI

struct ScanDetailView: View {
    @EnvironmentObject var bleManager: CoreBluetoothViewModel
    
    @Binding var isRootViewActive: Bool
    
    var body: some View {
        VStack {
            Button(action: {
                isRootViewActive = false
                bleManager.disconnectPeripheral()
                bleManager.stopScan()
            }) {
                UIButtonView(text: "disconnect")
            }
            
            Text(bleManager.isBlePower ? "" : "To set bluetooth on in the system settings.")
                .padding(10)
            
            CharacteriticCells()
       
            .navigationBarTitle("connect detail")
            .navigationBarBackButtonHidden(true)
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
    
    struct CharacteriticCells: View {
        @EnvironmentObject var bleManager: CoreBluetoothViewModel
        
        var body: some View {
            List {
                ForEach(0..<bleManager.foundServices.count, id: \.self) { num in
                    Section(header: Text("\(bleManager.foundServices[num].uuid.uuidString)")) {
                        ForEach(0..<bleManager.foundCharacteristics.count, id: \.self) { j in
                            if bleManager.foundServices[num].uuid == bleManager.foundCharacteristics[j].service.uuid {
                                Button(action: {
                                    //write action
                                }) {
                                    VStack {
                                        HStack {
                                            Text("uuid: \(bleManager.foundCharacteristics[j].uuid.uuidString)")
                                                .font(.system(size: 14))
                                                .padding(.bottom, 2)
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            Text("description: \(bleManager.foundCharacteristics[j].description)")
                                                .font(.system(size: 14))
                                                .padding(.bottom, 2)
                                            Spacer()
                                        }
                                        HStack {
                                            Text("value: \(bleManager.foundCharacteristics[j].readValue)")
                                                .font(.system(size: 14))
                                                .padding(.bottom, 2)
                                            Spacer()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

