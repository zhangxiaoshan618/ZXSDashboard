//
//  ViewController.swift
//  ZXSDashboard
//
//  Created by 张晓珊 on 16/6/14.
//  Copyright © 2016年 张晓珊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    weak var link: CADisplayLink?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(meterView)
        
        view.addSubview(sectionMeterView)
        
    }
    
    /// 添加定时器
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        startLink()
    }
    
    func startLink() {
        let link = CADisplayLink(target: self, selector: #selector(ViewController.add))
        link.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
        self.link = link
    }
    
    /// 没有到指定值的时候，每次角度增加0.01，到指定值移除定时器
    func add() {
        sectionMeterView.hidden ?
            meterView.progressView.value < 1.5 ? meterView.progressView.value += 0.01 : stopLink() :
            sectionMeterView.sectionProtressView.value < 550 ? sectionMeterView.sectionProtressView.value += 1 : stopLink()
    }
    
    /// 停止定时器
    func stopLink(){
        link?.invalidate()
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        stopLink()
        if sectionMeterView.hidden {
            meterView.hidden = true
            meterView.progressView.value = 0
            sectionMeterView.hidden = false
            startLink()
        }else {
            sectionMeterView.hidden = true
            sectionMeterView.sectionProtressView.value = 0
            meterView.hidden = false
            
            startLink()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 仪表盘控件
    private lazy var meterView: ZXSMeterView = {
        let meterView = ZXSMeterView()
        meterView.frame = CGRectMake(20, 20, 150, 150)
        meterView.backgroundColor = UIColor.whiteColor()
        return meterView
    }()
    
    // 分段表盘控件
    private lazy var sectionMeterView: ZXSSectionMeterView = {
        let sectionMeterView = ZXSSectionMeterView(frame: CGRectMake(20, 20, 150, 150))
        sectionMeterView.hidden = true
        return sectionMeterView
    }()

    
    private lazy var testVeiw: UIView = {
        let view = UIView(frame: CGRectMake(0, 0, 150, 150))
        view.backgroundColor = UIColor.blueColor()
        return view
    }()
    
    

}

