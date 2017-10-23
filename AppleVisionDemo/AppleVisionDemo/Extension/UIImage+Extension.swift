//
//  UIImage+Extension.swift
//  AppleVisionDemo
//
//  Created by S.t on 2017/10/22.
//  Copyright © 2017年 S.t. All rights reserved.
//

import UIKit
import CoreGraphics
import Vision

extension UIImage{
    
    func highlightLandmarks(request: VNDetectFaceLandmarksRequest, withStrokeWidth strokeWidth: CGFloat, withStrokeColor strokeColor: CGColor) -> UIImage? {
        let size = self.size
        
        // Begin to draw.
        UIGraphicsBeginImageContext(size)
        
        self.draw(at: CGPoint.zero)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(strokeColor)
        context?.setFillColor(strokeColor)
        context?.setLineWidth(strokeWidth)
        
        
        
        // Safe Getting the detection results and the input observations .
        guard let results = request.results as? [VNFaceObservation], let inputObservations = request.inputFaceObservations, results.count == inputObservations.count else{
            return nil
        }
        
        // Draw faces.
        for index in 0..<inputObservations.count{
            guard let landMark = results[index].landmarks else{
                continue
            }
            // Get the rect of the parent rectangle where the landmarks reside.
            // Since the coordination of Vision is flipped, coordination transformation is need.
            let parentRect = inputObservations[index].boundingBox
            let flippedParentRect = CGRect.generateRect(withScale: parentRect, size: size)

            // draw face contour
            if let faceContour = landMark.faceContour{
                let scalePoints = faceContour.normalizedPoints
                let newPoints = CGPoint.flipPoints(forPoints: scalePoints, withinSize: flippedParentRect.size, withOffset: flippedParentRect.origin)
                // Paint paths.
                context?.move(to: newPoints.first!)
                for point in newPoints{
                    context?.addLine(to: point)
                    context?.strokePath()
                    context?.move(to: point)
                }
            }
            
            // draw nose
            if let nose = landMark.nose{
                let scalePoints = nose.normalizedPoints
                let newPoints = CGPoint.flipPoints(forPoints: scalePoints, withinSize: flippedParentRect.size, withOffset: flippedParentRect.origin)
                // Paint paths.
                context?.move(to: newPoints.first!)
                for point in newPoints{
                    context?.addLine(to: point)
                    context?.strokePath()
                    context?.move(to: point)
                }
            }
            
            // draw nose crest
            if let nosecrest = landMark.noseCrest{
                let scalePoints = nosecrest.normalizedPoints
                let newPoints = CGPoint.flipPoints(forPoints: scalePoints, withinSize: flippedParentRect.size, withOffset: flippedParentRect.origin)
                // Paint paths.
                context?.move(to: newPoints.first!)
                for point in newPoints{
                    context?.addLine(to: point)
                    context?.strokePath()
                    context?.move(to: point)
                }
            }
            
            // draw inner lips
            if let innerLips = landMark.innerLips{
                let scalePoints = innerLips.normalizedPoints
                let newPoints = CGPoint.flipPoints(forPoints: scalePoints, withinSize: flippedParentRect.size, withOffset: flippedParentRect.origin)
                // Paint paths.
                context?.move(to: newPoints.first!)
                for point in newPoints{
                    context?.addLine(to: point)
                    context?.strokePath()
                    context?.move(to: point)
                }
            }
            
            // draw outer lips.
            if let outerLips = landMark.outerLips{
                let scalePoints = outerLips.normalizedPoints
                let newPoints = CGPoint.flipPoints(forPoints: scalePoints, withinSize: flippedParentRect.size, withOffset: flippedParentRect.origin)
                // Paint paths.
                context?.move(to: newPoints.first!)
                for point in newPoints{
                    context?.addLine(to: point)
                    context?.strokePath()
                    context?.move(to: point)
                }
            }
            
            // draw left eye
            if let leftEye = landMark.leftEye{
                let scalePoints = leftEye.normalizedPoints
                let newPoints = CGPoint.flipPoints(forPoints: scalePoints, withinSize: flippedParentRect.size, withOffset: flippedParentRect.origin)
                // Paint paths.
                context?.move(to: newPoints.first!)
                for point in newPoints{
                    context?.addLine(to: point)
                    context?.strokePath()
                    context?.move(to: point)
                }
            }
            
            // draw right eye
            if let rightEye = landMark.rightEye{
                let scalePoints = rightEye.normalizedPoints
                let newPoints = CGPoint.flipPoints(forPoints: scalePoints, withinSize: flippedParentRect.size, withOffset: flippedParentRect.origin)
                // Paint paths.
                context?.move(to: newPoints.first!)
                for point in newPoints{
                    context?.addLine(to: point)
                    context?.strokePath()
                    context?.move(to: point)
                }
            }
            
            // draw left eyebrow
            if let leftEyebrow = landMark.leftEyebrow{
                let scalePoints = leftEyebrow.normalizedPoints
                let newPoints = CGPoint.flipPoints(forPoints: scalePoints, withinSize: flippedParentRect.size, withOffset: flippedParentRect.origin)
                // Paint paths.
                context?.move(to: newPoints.first!)
                for point in newPoints{
                    context?.addLine(to: point)
                    context?.strokePath()
                    context?.move(to: point)
                }
            }
            
            // draw right eyebrow
            if let rightEyebrow = landMark.rightEyebrow{
                let scalePoints = rightEyebrow.normalizedPoints
                let newPoints = CGPoint.flipPoints(forPoints: scalePoints, withinSize: flippedParentRect.size, withOffset: flippedParentRect.origin)
                // Paint paths.
                context?.move(to: newPoints.first!)
                for point in newPoints{
                    context?.addLine(to: point)
                    context?.strokePath()
                    context?.move(to: point)
                }
            }
            
            // draw left pupil
            if let leftPupil = landMark.leftPupil{
                let scalePoints = leftPupil.normalizedPoints
                let newPoints = CGPoint.flipPoints(forPoints: scalePoints, withinSize: flippedParentRect.size, withOffset: flippedParentRect.origin)
                // Paint paths.
                context?.move(to: newPoints.first!)
                for point in newPoints{
                    context?.addLine(to: point)
                    context?.strokePath()
                    context?.move(to: point)
                }
            }
            
            // draw right pupil
            if let rightPupil = landMark.rightPupil{
                let scalePoints = rightPupil.normalizedPoints
                let newPoints = CGPoint.flipPoints(forPoints: scalePoints, withinSize: flippedParentRect.size, withOffset: flippedParentRect.origin)
                // Paint paths.
                context?.move(to: newPoints.first!)
                for point in newPoints{
                    context?.addLine(to: point)
                    context?.strokePath()
                    context?.move(to: point)
                }
            }
        }
        // Get image from context.
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func highlightDetectedObjects(forRects rects: [CGRect], withStrokeWidth strokeWidth: CGFloat, withStrokeColor strokeColor: CGColor) -> UIImage?{
        
        let size = self.size
        UIGraphicsBeginImageContext(self.size)
        
        // Draw image of self.
        self.draw(at: CGPoint.zero)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(strokeWidth)
        context?.setStrokeColor(strokeColor)
        context?.setFillColor(strokeColor)
        // Draw the rectangles of detected objects.
        for bound in rects{
            let rect = CGRect.generateRect(withScale: bound, size: size)

            context?.stroke(rect)
        }
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
