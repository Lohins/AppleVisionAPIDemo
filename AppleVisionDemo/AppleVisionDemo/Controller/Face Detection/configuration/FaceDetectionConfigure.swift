//
//  FaceDetectionConfigure.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/22.
//  Copyright © 2017年 S.t. All rights reserved.
//

import Foundation
import UIKit


enum FaceDetectionType : Int {
    case FaceRectangle
    case FaceLandmarks
    
    static var count : Int{
        return FaceDetectionType.FaceLandmarks.rawValue + 1
    }
}

enum MarkColor : Int {
    case Red
    case Blue
    case White
    case Black
    static var count : Int{
        return MarkColor.Black.rawValue + 1
    }
    var trueValue: CGColor{
        switch self {
        case .Black:
            return UIColor.black.cgColor
        case .Blue:
            return UIColor.blue.cgColor
        case .Red:
            return UIColor.red.cgColor
        case  .White:
            return UIColor.white.cgColor
        }
    }
}

enum MarkWidth: Int{
    case OnePixel
    case TwoPixel
    
    static var count : Int{
        return MarkWidth.TwoPixel.rawValue + 1
    }
    
    var trueValue: CGFloat{
        switch self {
        case .OnePixel:
            return 1.0
        case .TwoPixel:
            return 2.0
        }
    }
}

struct FaceDetectionUserDefaultKeys {
    static let detectionType = "detection type"
    static let markColor = "mark color"
    static let markWidth = "mark width"
}

extension UserDefaults{
    
    // Get the default setting of face detection type : rectangle or landmark.
    static func faceDetectionType() -> FaceDetectionType{
        let value = UserDefaults.standard.integer(forKey: FaceDetectionUserDefaultKeys.detectionType)
        return FaceDetectionType(rawValue: value) ?? FaceDetectionType.FaceRectangle
    }
    
    static func setFaceDetectionType(withType type: FaceDetectionType){
        UserDefaults.standard.set(type.rawValue, forKey: FaceDetectionUserDefaultKeys.detectionType)
    }
    
    // Get the default setting of mark color.
    static func markColor() -> MarkColor{
        let value = UserDefaults.standard.integer(forKey: FaceDetectionUserDefaultKeys.markColor)
        return MarkColor(rawValue: value) ?? MarkColor.Red
    }
    
    static func setMarkColor(withType type: MarkColor){
        UserDefaults.standard.set(type.rawValue, forKey: FaceDetectionUserDefaultKeys.markColor)
    }
    
    
    // Get the default setting of mark width.
    static func markWidth() -> MarkWidth{
        let value = UserDefaults.standard.integer(forKey: FaceDetectionUserDefaultKeys.markWidth)
        return MarkWidth(rawValue: value) ?? MarkWidth.OnePixel
    }
    
    static func setMarkWidth(withType type: MarkWidth){
        UserDefaults.standard.set(type.rawValue, forKey: FaceDetectionUserDefaultKeys.markWidth)
    }

}
