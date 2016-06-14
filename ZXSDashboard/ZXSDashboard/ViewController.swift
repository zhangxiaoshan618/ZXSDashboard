//
//  ViewController.swift
//  ZXSDashboard
//
//  Created by 张晓珊 on 16/6/14.
//  Copyright © 2016年 张晓珊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(meterView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private lazy var meterView: ZXSMeterView = {
        let meterView = ZXSMeterView()
        meterView.frame = CGRectMake(20, 20, 150, 150)
        meterView.backgroundColor = UIColor.whiteColor()
        return meterView
    }()
    
    
    private lazy var testVeiw: UIView = {
        let view = UIView(frame: CGRectMake(0, 0, 150, 150))
        view.backgroundColor = UIColor.blueColor()
        return view
    }()

}

