//
//  DemoViewController.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/24.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit
import SnapKit

class DemoViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        let dismissButton = UIButton()
        dismissButton.setTitle("这里展示详情页面,点击退出", forState: .Normal)
        dismissButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        dismissButton.addTarget(self, action: #selector(DemoViewController.dismissAction(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(dismissButton)
        
        dismissButton.snp_makeConstraints { (make) in
            make.center.equalTo(view)
            make.left.right.equalTo(view)
        }
    }
    
    
    func dismissAction(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
