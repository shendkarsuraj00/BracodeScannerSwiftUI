//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Macbook on 12/12/24.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    
    @Published var barcode = ""
    @Published var alertItem: AlertItem?
    @Published var isShowingAlert = false
    
    var statusText: String {
        barcode.isEmpty ? "Not Yet Sacnned": barcode
    }
   
    var stausColor: Color {
        barcode.isEmpty ? .red: .green
    }
}

   
