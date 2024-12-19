//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Macbook on 11/12/24.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannerCode: String
    @Binding var alertItem: AlertItem?
    @Binding var isShowingAlert: Bool
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
   
}

final class Coordinator: NSObject, ScannerVCDelegate {
    
    private let scannerView: ScannerView
    
    init(scannerView: ScannerView) {
        self.scannerView = scannerView
    }
    
    func didFind(barcode: String) {
        print(barcode)
        scannerView.scannerCode = barcode
    }
    
    func didSurface(error: CameraError) {
        print(error)
        DispatchQueue.main.async { [weak self] in
            switch error {
            case .invalidDeviceInput:
                self?.scannerView.alertItem = AlertContext.invalidDeviceType
                self?.scannerView.isShowingAlert = true
            case .invalidScannedValue:
                self?.scannerView.alertItem = AlertContext.invalidScannedType
                self?.scannerView.isShowingAlert = true
            }
        }
    }
    
    
}
