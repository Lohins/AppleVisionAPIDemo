//
//  BarcodeDetectionViewModel.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/23.
//  Copyright © 2017年 S.t. All rights reserved.
//

import UIKit

import Vision.VNDetectBarcodesRequest

struct BarcodeDetectionViewModel : VisionViewModelProtocol {
    
    func barcodeDetect(forImage image : UIImage, withCompleter completer: @escaping completion) {
        
        DispatchQueue.global().async {
            
            guard let cgImage = image.cgImage else {
                return
            }
            
            // Init request and handler
            let request = VNDetectBarcodesRequest.init()
            
            let handler = VNImageRequestHandler.init(cgImage: cgImage, options: [:])
            
            do{
                try handler.perform([request])
            }
            catch{
                print(error.localizedDescription)
            }
            
            guard let results = request.results as? [VNBarcodeObservation] else {
                return
            }
            
            for item in results{
                print(item.payloadStringValue)
                print(item.symbology)
                print(item.barcodeDescriptor)
                print(item.boundingBox)
            }
            
        }
      
        completer(nil)
        
        return
    }
    
}
