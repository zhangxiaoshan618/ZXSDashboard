//
//  ZXSSectionView.swift
//  ZXSDashboard
//
//  Created by 张晓珊 on 16/7/28.
//  Copyright © 2016年 张晓珊. All rights reserved.
//

import UIKit

class ZXSSectionView: UIView {

    override func drawRect(rect: CGRect) {
        // 外圆距离View的边界的宽度
        let margin: CGFloat = 30.0
        
        // 刻度线的长度
        let scaleLineLength: CGFloat = 5.0
        
        // 圆心X
        let centerX = bounds.width * 0.5
        
        // 圆心Y
        let centerY = bounds.height * 0.5
        
        // 外圆的半径
        let radiuOutsid = bounds.width * 0.5 - margin
        
        // 外圆和内圆之间的距离 
        let space: CGFloat = 5.0
        
        // 内圆的半径
        let radiuInsid = radiuOutsid - space
        
        // 计算 3/7 π 的时候内圆和外圆上的点的坐标
        let pointInsidX = centerX - radiuInsid * sin(CGFloat(M_PI) * 3.0 / 7.0)
        let pointInsidY = centerY + radiuInsid * cos(CGFloat(M_PI) * 3.0 / 7.0)
        
        let pointOutsidX = centerX - radiuOutsid * sin(CGFloat(M_PI) * 3.0 / 7.0)
        let pointOutsidY = centerY + radiuOutsid * cos(CGFloat(M_PI) * 3.0 / 7.0)
        
        // 计算 3/7 π 的时候刻度两端的坐标
        let scaleInsideX = centerX - (radiuOutsid + 1) * sin(CGFloat(M_PI) * 3.0 / 7.0)
        let scaleInsideY = centerY + (radiuOutsid + 1) * cos(CGFloat(M_PI) * 3.0 / 7.0)
        
        let scaleOutsidX = centerX - (radiuOutsid + 1 + scaleLineLength) * sin(CGFloat(M_PI) * 3.0 / 7.0)
        let scaleOutsidY = centerY + (radiuOutsid + 1 + scaleLineLength) * cos(CGFloat(M_PI) * 3.0 / 7.0)
        
        
        // 创建路径对象
        let pathGreen = UIBezierPath()
        
        // 拼接路径
        pathGreen.moveToPoint(CGPoint(x: centerX , y: centerY - radiuOutsid))
        pathGreen.addArcWithCenter(CGPoint(x: centerX, y: centerY), radius: radiuOutsid, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat(M_PI_2), clockwise: true)
        pathGreen.addLineToPoint(CGPoint(x: centerX, y: centerY + radiuInsid))
        pathGreen.addArcWithCenter(CGPoint(x: centerX, y: centerY), radius: radiuInsid, startAngle: CGFloat(M_PI_2), endAngle: CGFloat(-M_PI_2), clockwise: false)
        pathGreen.addLineToPoint(CGPoint(x: centerX, y: centerY - radiuOutsid))
        
        pathGreen.closePath()
        
        // 设置路径颜色
        UIColor.greenColor().setStroke()
        
        // 渲染路径
        pathGreen.stroke()
        
        let pathYellow = UIBezierPath()
        
        pathYellow.moveToPoint(CGPoint(x: centerX, y: centerY + radiuInsid))
        pathYellow.addLineToPoint(CGPoint(x: centerX, y: centerY + radiuOutsid))
        pathYellow.addArcWithCenter(CGPoint(x: centerX, y: centerY), radius: radiuOutsid, startAngle: CGFloat(M_PI_2), endAngle: CGFloat(M_PI * 2 * 5 / 7 - M_PI_2), clockwise: true)
        pathYellow.addLineToPoint(CGPoint(x: pointOutsidX, y: pointOutsidY))
        pathYellow.addArcWithCenter(CGPoint(x: centerX, y: centerY), radius: radiuInsid, startAngle: CGFloat(M_PI * 2 * 5 / 7 - M_PI_2), endAngle: CGFloat(M_PI_2), clockwise: false)
        
        pathYellow.closePath()
        
        
        UIColor.yellowColor().setStroke()
        
        pathYellow.stroke()
        
        
        let pathRed = UIBezierPath()
        
        pathRed.moveToPoint(CGPoint(x: pointInsidX, y: pointInsidY))
        pathRed.addLineToPoint(CGPoint(x: pointOutsidX, y: pointOutsidY))
        pathRed.addArcWithCenter(CGPoint(x: centerX, y: centerY), radius: radiuOutsid, startAngle: CGFloat(M_PI * 2 * 5 / 7 - M_PI_2), endAngle: CGFloat(3 * M_PI_2), clockwise: true)
        pathRed.addLineToPoint(CGPoint(x: centerX, y: centerY - radiuOutsid))
        pathRed.addArcWithCenter(CGPoint(x: centerX, y: centerY), radius: radiuInsid, startAngle: CGFloat(3 * M_PI_2), endAngle: CGFloat(M_PI * 2 * 5 / 7 - M_PI_2), clockwise: false)
        
        pathRed.closePath()
        
        UIColor.redColor().setStroke()
        
        pathRed.stroke()
        
        let pathScale = UIBezierPath()
        
        pathScale.moveToPoint(CGPoint(x: centerX, y: centerY - radiuOutsid - 1))
        pathScale.addLineToPoint(CGPoint(x: centerX, y: centerY - radiuOutsid - 1 - scaleLineLength))
        
        pathScale.moveToPoint(CGPoint(x: centerX, y: centerY + radiuOutsid + 1))
        pathScale.addLineToPoint(CGPoint(x: centerX, y: centerY + radiuOutsid + 1 + scaleLineLength))
        
        pathScale.moveToPoint(CGPoint(x: scaleInsideX, y: scaleInsideY))
        pathScale.addLineToPoint(CGPoint(x: scaleOutsidX, y: scaleOutsidY))
        
        pathScale.closePath()
        
        pathScale.lineWidth = 2
        
        UIColor.darkGrayColor().setStroke()
        
        pathScale.stroke()
        
        // 拿到要绘制的文字
        let scale0: NSString = "0"
        let scale350: NSString = "350"
        let scale500: NSString = "500"
        
        // 设置绘制样式
        let dict: [String: AnyObject] = [NSForegroundColorAttributeName : UIColor.darkGrayColor(),
                                         NSFontAttributeName            : UIFont.systemFontOfSize(15)]
        
        // 绘制 - 绘制到指定的区域
        scale0.drawAtPoint(CGPointMake(centerX - 5, centerY - radiuOutsid - 1 - scaleLineLength - 1 - 15), withAttributes: dict)
        
        scale350.drawAtPoint(CGPointMake(centerX - 15, centerY + radiuOutsid + 1 + scaleLineLength + 1), withAttributes: dict)
        
        scale500.drawAtPoint(CGPointMake(scaleOutsidX - 25, scaleOutsidY + 3), withAttributes: dict)
    }


}









































