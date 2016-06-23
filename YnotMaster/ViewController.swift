//
//  ViewController.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/4.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ADProtocol {
    
    /**
     1.网络请求类，父类，控件类（没必要，不知道具体请求的是什么控件）
     2.数据的解析封装，交付给相应控件怎样的数据。
     3.跳转事件的判定，参数判断？协议判断？
     4.面向接口编程实现拓展
    */
    
    var wrapper: YNControlWrapper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None
        
        let manager = WidgetsParseManager()
        let itemArray = manager.loadJSONData()
        
        for item in itemArray {
            guard let name = item.name,
                    let left = item.left,
                    let top = item.top,
                    let width = item.width,
                    let height = item.height else { return }
            wrapper = YNControlWrapper(name: name, frame: CGRectMake(left, top, width, height), model: item)
            if let subview = wrapper?.subView {
                subview.delegate = self
                view.addSubview(subview)
            }
        }
    }
}

