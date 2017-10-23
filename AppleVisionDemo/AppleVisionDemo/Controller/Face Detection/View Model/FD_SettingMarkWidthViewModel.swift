//
//  FD_SettingMarkWidthViewModel.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/23.
//  Copyright © 2017年 S.t. All rights reserved.
//

import UIKit

struct FD_SettingMarkWidthViewModel: FD_SettingViewModelProtocol {
    
    let model : MarkWidth
    
    var text: String{
        
        switch self.model {
        case .OnePixel:
            return "One Pixel"
        case .TwoPixel:
            return "Two Pixels"
        }
    }
    
    var accessaryType: UITableViewCellAccessoryType{
        if self.model.rawValue == UserDefaults.markWidth().rawValue{
            return UITableViewCellAccessoryType.checkmark
        }
        return UITableViewCellAccessoryType.none
    }
}
