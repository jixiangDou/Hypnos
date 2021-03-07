//
//  Service.swift
//  Hypnos
//
//  Created by 窦勇伟 on 2021/03/07.
//

import Foundation
import CoreBluetooth

class Service: Identifiable {
    var id: UUID
    var uuid: CBUUID
    var service: CBService

    init(_uuid: CBUUID,
         _service: CBService) {
        
        id = UUID()
        uuid = _uuid
        service = _service
    }
}
