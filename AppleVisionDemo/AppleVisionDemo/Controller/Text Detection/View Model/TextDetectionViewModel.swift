//
//  TextDetectionViewModel.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/23.
//  Copyright © 2017年 S.t. All rights reserved.
//

import UIKit
import Vision

struct TextDetectionViewModel : VisionViewModelProtocol {
    
    func detectText(forImage image: UIImage, withCompletion Completion: @escaping completion){
        
        DispatchQueue.global().async {
            
            guard let cgImage = image.cgImage else{
                return
            }
            
            // Init request and handler.
            let request = VNDetectTextRectanglesRequest.init()
            
            let handler = VNImageRequestHandler.init(cgImage: cgImage, options: [:])
            
            do{
                try handler.perform([request])
            }
            catch{
                print(error.localizedDescription)
            }
            
            guard let results = request.results as? [VNTextObservation] else {
                return
            }
            
            var rects = [CGRect]()
            for item in results{
                rects.append(item.boundingBox)
                print(item.boundingBox)
            }
            
            let newImage = image.highlightDetectedObjects(forRects: rects, withStrokeWidth: 1.0, withStrokeColor: UIColor.red.cgColor)
            
            Completion(newImage)
        }
        
    }
}
