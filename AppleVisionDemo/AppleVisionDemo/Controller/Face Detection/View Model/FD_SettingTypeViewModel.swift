//
//  FD_SettingTypeViewModel.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/23.
//  Copyright © 2017年 S.t. All rights reserved.
//

import Foundation
import UIKit


struct FD_SettingTypeViewModel: FD_SettingViewModelProtocol {
    
    let model : FaceDetectionType
    
    var text: String{
        
        switch self.model {
        case .FaceRectangle:
            return "Face Rectangle"
        case .FaceLandmarks:
            return "Face Landmark"
        }
    }
    
    var accessaryType: UITableViewCellAccessoryType{
        if self.model.rawValue == UserDefaults.faceDetectionType().rawValue{
            return UITableViewCellAccessoryType.checkmark
        }
        return UITableViewCellAccessoryType.none
    }
}
