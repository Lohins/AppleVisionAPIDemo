//
//  MP_FuncTableViewCell.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/22.
//  Copyright © 2017年 S.t. All rights reserved.
//

import UIKit

class MP_FuncTableViewCell: UITableViewCell {
    
    static let identifier = "MP_FuncTableViewCell"
    
    static let CellHeight : CGFloat = 50

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withText text :String ){
        self.textLabel?.text = text
    }

}
