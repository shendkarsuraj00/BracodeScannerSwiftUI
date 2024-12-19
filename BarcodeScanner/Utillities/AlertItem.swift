//
//  AlertItem.swift
//  BarcodeScanner
//
//  Created by Macbook on 12/12/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id  = UUID()
    let title: String
    let message: String
}

struct AlertContext {
    static let invalidDeviceType = AlertItem(title: "Invalid Device Type", message: "Somthing worng with camera. We are unable to capture input.")
    
    static let invalidScannedType = AlertItem(title: "Invalid Scan Type", message: "The value scanned is not valid. This app is scan EAN-8 & EAN-13.")
}
