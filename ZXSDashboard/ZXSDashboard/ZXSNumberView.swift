//
//  ZXSNumberView.swift
//  仪表盘作图
//
//  Created by 张晓珊 on 16/6/13.
//  Copyright © 2016年 张晓珊. All rights reserved.
//

import UIKit

class ZXSNumberView: UIView {
    
    var label: UILabel?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setUpUI()
    }
    
    private func setUpUI() {
        let width = bounds.width
        let radiu = width * 0.5
        let offset = radiu * sin(CGFloat(M_PI_4))
        
        for i in 0..<8 {
            let label = UILabel()
            label.text = "\(i)"
            label.frame = CGRectMake(0, 0, 20, 20)
            var center = CGPointZero
            
            switch i {
            case 0:
                center = CGPointMake(radiu, 10)
            case 1:
                center = CGPointMake(radiu + offset - 6.0, radiu - offset + 6.0)
            case 2:
                center = CGPointMake(width - 10, radiu)
                
            case 3:
                center = CGPointMake(radiu + offset - 6.0, radiu + offset - 6.0)
            case 4:
                center = CGPointMake(radiu, width - 10 )
            case 5:
                center = CGPointMake(radiu - offset + 6.0, radiu + offset - 6.0)
            case 6:
                center = CGPointMake(10, radiu)
            case 7:
                center = CGPointMake(radiu - offset + 6.0, radiu - offset + 6.0)
            default:
                break
            }
            print(center)
            label.center = center
            label.font = UIFont.systemFontOfSize(17)
            label.textAlignment = NSTextAlignment.Center
            addSubview(label)
        }
        
        for i in 0..<4 {
            let line = UIView()
            line.backgroundColor = UIColor.blackColor()
            line.frame = CGRectMake(radiu - 0.5, 20, 1, width - 40)
            addSubview(line)
            line.layer.anchorPoint = CGPointMake(0.5, 0.5)
            line.center = CGPointMake(radiu, radiu)
            line.transform = CGAffineTransformRotate(line.transform, CGFloat(Double(i) * M_PI_4))
        }
    }
}
