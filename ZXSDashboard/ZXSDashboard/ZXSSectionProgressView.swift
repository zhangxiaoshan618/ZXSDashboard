//
//  ZXSSectionProgressView.swift
//  ZXSDashboard
//
//  Created by 张晓珊 on 16/7/28.
//  Copyright © 2016年 张晓珊. All rights reserved.
//

import UIKit

class ZXSSectionProgressView: UIView {
    
    var value: Int = 0 {
        didSet {
            print("\(value)")
            setNeedsDisplay()
        }
    }
    

    override func drawRect(rect: CGRect) {
        
        // 外圆距离View的边界的宽度
        let margin: CGFloat = 30.0
        
        // 圆心X
        let centerX = bounds.width * 0.5
        
        // 圆心Y
        let centerY = bounds.height * 0.5
        
        // 外圆的线宽
        let lineWidth: CGFloat = 7
        
        // 外圆的半径
        let radiuOutsid = bounds.width * 0.5 - margin - lineWidth * 0.5 + 1
        
        // 内圆的半径
        let radiuInsid = radiuOutsid - lineWidth * 0.5
        
        // 创建路径对象
        let pathProgress = UIBezierPath()
        
        // 拼接路径
        pathProgress.moveToPoint(CGPoint(x: centerX, y: centerY))
        pathProgress.addLineToPoint(CGPoint(x: centerX, y: centerY - radiuOutsid))
        pathProgress.addArcWithCenter(CGPoint(x: centerX, y: centerY), radius: radiuOutsid, startAngle: CGFloat(-M_PI_2), endAngle: 2 * CGFloat(M_PI) * CGFloat(value) / 700.0 - CGFloat(M_PI_2), clockwise: true)
        
        pathProgress.closePath()
        
        pathProgress.lineWidth = lineWidth
        
        // 设置路径颜色
        if value < 350 {
            UIColor.greenColor().setStroke()
        }else if value < 500 {
            UIColor.yellowColor().setStroke()
        }else {
            UIColor.redColor().setStroke()
        }
        
        // 渲染路径
        pathProgress.stroke()
        
        
        /// 画出白色的圆遮住中间的线
        let path = UIBezierPath()
        
        path.addArcWithCenter(CGPoint(x: centerX, y: centerY), radius: radiuInsid, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true)
        
        UIColor.whiteColor().setFill()
        
        path.fill()
        
        
        let valueStr: NSString = "\(value)"
        
        // 设置绘制样式
        let dict: [String: AnyObject] = [NSForegroundColorAttributeName : UIColor.darkGrayColor(),
                                         NSFontAttributeName            : UIFont.systemFontOfSize(20)]
        
        // 绘制 - 绘制到指定的区域
        valueStr.drawInRect(CGRectMake(centerX - 20, centerY - 10, 100, 20), withAttributes: dict)
        
        
    }

}



















