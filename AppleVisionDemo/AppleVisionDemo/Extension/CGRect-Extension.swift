//
//  CGRect-Extension.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/22.
//  Copyright © 2017年 S.t. All rights reserved.
//

import UIKit


extension CGRect{
    static func generateRect(withScale scale: CGRect, size: CGSize) -> CGRect{
        let scaleSize = CGSize.init(width: scale.width * size.width, height: scale.height * size.height)
        let point = CGPoint.init(x: scale.origin.x * size.width, y: (1 - scale.origin.y) * size.height - scaleSize.height)
        let result = CGRect.init(origin: point, size: scaleSize)
        return result
    }
    
    func scale(withScale scale:CGRect) -> CGRect{
        return CGRect.init(x: scale.origin.x * self.origin.x, y: scale.origin.y * self.origin.y, width: scale.width * self.width, height: scale.height * self.height)
    }
}
