//
//  MainPageViewModel.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/22.
//  Copyright © 2017年 S.t. All rights reserved.
//

import Foundation

public enum VisionFunction: Int{
    case FaceDetection, RectangleDetection, BarcodeDetection, TextDetection, ObjectTracking
    
    static func number()-> Int{
        return 5
    }
    func text() -> String{
        switch self {
        case .FaceDetection:
            return "Face Detection"
        case .RectangleDetection:
            return "Rectengle Detection"
        case .BarcodeDetection:
            return "Barcode Detection"
        case .TextDetection:
            return "Text Detection"
        case .ObjectTracking:
            return "Object Tracking"
        }
    }
}

struct MainPageViewModel {

    
    
    // MARK : Properties
    
    var number : Int{
        return VisionFunction.number()
    }
    
    func title(forIndex index : Int) -> String?{
        guard let function = VisionFunction.init(rawValue: index) else{
            return nil
        }
        return function.text()
    }
    
    
}


