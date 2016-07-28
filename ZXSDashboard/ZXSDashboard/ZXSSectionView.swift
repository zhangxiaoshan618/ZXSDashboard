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
        // 圆心X
        let centerX = bounds.width * 0.5
        
        // 圆心Y
        let centerY = bounds.height * 0.5
        
        // 外圆的半径
        let radiuOutsid = bounds.width * 0.5 - 20
        
        // 外圆和内圆之间的距离 
        let space: CGFloat = 5.0
        
        // 内圆的半径
        let radiuInsid = radiuOutsid - space
        
        // 计算 3/7 π 的时候内圆和外圆上的点的坐标
        let pointInsidX = centerX - radiuInsid * sin(CGFloat(M_PI) * 3.0 / 7.0)
        let pointInsidY = centerY + radiuInsid * cos(CGFloat(M_PI) * 3.0 / 7.0)
        
        let pointOutsidX = centerX - radiuOutsid * sin(CGFloat(M_PI) * 3.0 / 7.0)
        let pointOutsidY = centerY + radiuOutsid * cos(CGFloat(M_PI) * 3.0 / 7.0)
        
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
        
//        let pathScale0 = UIBezierPath()
        
        
        
    }

}
