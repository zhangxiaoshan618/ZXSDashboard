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
        
        view.addSubview(sectionView)
        
        
    }
    
    /// 添加定时器
    override func viewDidAppear(animated: Bool) {
        let link = CADisplayLink(target: self, selector: #selector(ViewController.add))
        link.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
        self.link = link
    }
    
    /// 没有到指定值的时候，每次角度增加0.01，到指定值移除定时器
    func add() {
        meterView.progressView.value < 1.5 ? meterView.progressView.value += 0.01 : stopLink()
    }
    
    /// 停止定时器
    func stopLink(){
        link?.invalidate()
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
    
    private lazy var sectionView: ZXSSectionView = {
        let sectionView = ZXSSectionView(frame: CGRectMake(0, 200, 100, 100))
        sectionView.backgroundColor = UIColor.whiteColor()
        return sectionView
    }()
    
    
    private lazy var testVeiw: UIView = {
        let view = UIView(frame: CGRectMake(0, 0, 150, 150))
        view.backgroundColor = UIColor.blueColor()
        return view
    }()
    
    

}

