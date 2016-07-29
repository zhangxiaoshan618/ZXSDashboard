//
//  ZXSSectionMeterView.swift
//  ZXSDashboard
//
//  Created by 张晓珊 on 16/7/29.
//  Copyright © 2016年 张晓珊. All rights reserved.
//

import UIKit

class ZXSSectionMeterView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.whiteColor()
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        addSubview(sectionView)
        addSubview(sectionProtressView)
    }
    
    private lazy var sectionView: ZXSSectionView = {
        let sectionView = ZXSSectionView(frame: CGRectMake(0, 0, 150, 150))
        sectionView.backgroundColor = UIColor.whiteColor()
        return sectionView
    }()
    
    lazy var sectionProtressView: ZXSSectionProgressView = {
        let sectionProtressView = ZXSSectionProgressView(frame: CGRectMake(0, 0, 150, 150))
        sectionProtressView.backgroundColor = UIColor.clearColor()
        return sectionProtressView
    }()

}
