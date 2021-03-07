//
//  Mock.swift
//  Hypnos
//
//  Created by 窦勇伟 on 2021/03/07.
//

import Foundation

protocol Mock {}

extension Mock {
    var className: String {
        return String(describing: type(of: self))
    }
    
    func log(_ message: String? = nil) {
        print("Mocked -", className, message ?? "")
    }
}
