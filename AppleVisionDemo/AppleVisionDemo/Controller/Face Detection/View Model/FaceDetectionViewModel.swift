//
//  FaceDetectionViewModel.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/23.
//  Copyright © 2017年 S.t. All rights reserved.
//

import UIKit
import Vision


struct FaceDetectionViewModel {
    
    typealias completion = (_ image: UIImage?)-> Void
    func generateImage(image: UIImage, Completion: @escaping completion)  {
        if UserDefaults.faceDetectionType() == FaceDetectionType.FaceRectangle{
            self.faceDetection(image: image, completion: Completion)
        }
        else{
            self.faceLandmark(image: image, completion: Completion)
        }
    }
    
    private func detectFaceRectangles(image: UIImage) -> [VNFaceObservation]?{
        guard let cgImage = image.cgImage else{
            return nil
        }
        
        let request = VNDetectFaceRectanglesRequest.init()
        
        let handler = VNImageRequestHandler.init(cgImage: cgImage, options: [:])
        do{
            try handler.perform([request])
        }catch{
            print(error.localizedDescription)
        }
        
        let results = request.results as? [VNFaceObservation]
        return results
    }
    
    // Detect face landmarks
    private func faceLandmark(image: UIImage, completion: @escaping completion){
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            guard let observations = self.detectFaceRectangles(image: image), let cgImage = image.cgImage else{
                return
            }
            
            let request = VNDetectFaceLandmarksRequest.init()
            request.inputFaceObservations = observations
            
            let handler = VNImageRequestHandler.init(cgImage: cgImage, options: [:])
            
            do{
                try handler.perform([request])
            }
            catch{
                print(error.localizedDescription)
            }
            
            let defaultStrokeWidth = UserDefaults.markWidth()
            let defaultStrokeColor = UserDefaults.markColor()
            let newImage = image.highlightLandmarks(request: request, withStrokeWidth: defaultStrokeWidth.trueValue, withStrokeColor: defaultStrokeColor.trueValue)
            
            // call back
            completion(newImage)

        }
    }
    
    // Detect face rectangle
    private func faceDetection(image: UIImage, completion: @escaping completion){
        
        // Do the face detection work in background.
        DispatchQueue.global(qos: .userInitiated).async {

            guard let results = self.detectFaceRectangles(image: image) else{
                return
            }
            
            var rectList = [CGRect]()
            for observation in results {
                print(observation.boundingBox)
                rectList.append(observation.boundingBox)
            }
            
            let defaultStrokeWidth = UserDefaults.markWidth()
            let defaultStrokeColor = UserDefaults.markColor()
            
            let highlightImage = image.highlightDetectedObjects(forRects: rectList, withStrokeWidth: defaultStrokeWidth.trueValue, withStrokeColor: defaultStrokeColor.trueValue)
            
            completion(highlightImage)
        }
        
    }
}
