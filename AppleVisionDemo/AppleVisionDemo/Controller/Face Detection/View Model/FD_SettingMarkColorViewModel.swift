//
//  FD_SettingMarkColorViewModel.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/23.
//  Copyright © 2017年 S.t. All rights reserved.
//

import UIKit


struct FD_SettingMarkColorViewModel: FD_SettingViewModelProtocol {
    
    let model : MarkColor
    
    var text: String{
        
        switch self.model {
        case .Black:
            return "Black"
        case .Blue:
            return "Blue"
        case .Red:
            return "Red"
        case .White:
            return "White"
        }
    }
    
    var accessaryType: UITableViewCellAccessoryType{
        if self.model.rawValue == UserDefaults.markColor().rawValue{
            return UITableViewCellAccessoryType.checkmark
        }
        return UITableViewCellAccessoryType.none
    }
}
