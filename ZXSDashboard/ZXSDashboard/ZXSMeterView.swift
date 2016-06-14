//
//  ZXSMeterView.swift
//  仪表盘作图
//
//  Created by 张晓珊 on 16/6/13.
//  Copyright © 2016年 张晓珊. All rights reserved.
//

import UIKit

class ZXSMeterView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        addSubview(numberView)
        addSubview(progressView)
    }
    
    private lazy var numberView: ZXSNumberView = {
        let numberView = ZXSNumberView()
        numberView.frame = CGRectMake(0, 0, 150, 150)
        numberView.backgroundColor = UIColor.whiteColor()
        return numberView
    }()
    
    private lazy var progressView: ZXSProgressView = {
        let progressView = ZXSProgressView()
        progressView.backgroundColor = UIColor.clearColor()
        progressView.frame = CGRectMake(0, 0, 150, 150)
        return progressView
    }()

}
