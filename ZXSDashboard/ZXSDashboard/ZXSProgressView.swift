//
//  ZXSProgressView.swift
//  仪表盘作图
//
//  Created by 张晓珊 on 16/6/13.
//  Copyright © 2016年 张晓珊. All rights reserved.
//

import UIKit

class ZXSProgressView: UIView {

    override func drawRect(rect: CGRect) {
        
        let radiu = (bounds.width - 40.0 - 10.0) * 0.5
        
        let path0 = UIBezierPath(arcCenter: center, radius: radiu, startAngle: CGFloat(-M_PI_2), endAngle:CGFloat(2 * M_PI), clockwise: true)
        UIColor.yellowColor().set()
        path0.fill()
        
        let path1 = UIBezierPath(arcCenter: center, radius: radiu, startAngle: CGFloat(-M_PI_2), endAngle:CGFloat(M_PI), clockwise: true)
        path1.addLineToPoint(center)
        UIColor.blueColor().set()
        path1.fill()
        
        let path3 = UIBezierPath(arcCenter: center, radius: radiu - 10, startAngle: CGFloat(-M_PI_2), endAngle:CGFloat(2 * M_PI), clockwise: true)
        UIColor.whiteColor().set()
        path3.fill()
        
    }

}
