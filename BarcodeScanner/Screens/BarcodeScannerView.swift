//
//  BarcodeScannerView.swift
//  BarcodeScanner
//
//  Created by Macbook on 11/12/24.
//

import SwiftUI



struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(scannerCode: $viewModel.barcode, alertItem: $viewModel.alertItem, isShowingAlert: $viewModel.isShowingAlert)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(viewModel.stausColor)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(viewModel.alertItem?.title ?? "", isPresented: $viewModel.isShowingAlert, presenting: viewModel.alertItem) { alertItem in
                Button("Ok") {}
            } message: { alertItem in
                Text(alertItem.message)
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
