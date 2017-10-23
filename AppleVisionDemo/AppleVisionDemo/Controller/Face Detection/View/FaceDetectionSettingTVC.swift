//
//  FaceDetectionSettingTVC.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/23.
//  Copyright © 2017年 S.t. All rights reserved.
//

import UIKit

class FaceDetectionSettingTVC: UITableViewCell {
    
    static let identifier = "FaceDetectionSettingTVC"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withModel model: FD_SettingViewModelProtocol){
        self.textLabel?.text = model.text
        self.accessoryType = model.accessaryType
    }

}
