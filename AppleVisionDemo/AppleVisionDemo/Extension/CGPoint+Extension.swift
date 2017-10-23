//
//  CGSize+Extension.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/23.
//  Copyright © 2017年 S.t. All rights reserved.
//

import UIKit

extension CGPoint{
    
    static func flipPoints(forPoints points: [CGPoint], withinSize size: CGSize , withOffset offset: CGPoint) -> [CGPoint]{
        var result = [CGPoint]()
        
        for point in points{
            let newPoint = CGPoint.init(x: point.x * size.width + offset.x, y: (1 - point.y) * size.height + offset.y)
            result.append(newPoint)
        }
        return result
    }
}
