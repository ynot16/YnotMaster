//
//  ViewController.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/4.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, YNTControlClickProtocol {
    
    /**
     1.网络请求类，父类，控件类（没必要，不知道具体请求的是什么控件）
     2.数据的解析封装，交付给相应控件怎样的数据。
     3.跳转事件的判定，参数判断？协议判断？怎么判断
     4.面向接口编程实现拓展。
     
     5.跳转的页面的某些布局是否可以写死，而不用重新再走一遍配置的流程。
    */
    
    var wrapper: YNTControlWrapper?
    let manager = WidgetsParseManager()
    var config: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None
        view.backgroundColor = UIColor.whiteColor()
        
        Alamofire.request(.GET, "http://58.67.151.250:7051/MobileELearning/andorid/AnCourseWare!MobileTypes.do?&Mode=6&clientCode=bori&deviceType=iphone&userID=15833&version=1.0.0.0", parameters: nil)
            .responseJSON { response in
//                print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization
                
                if let data = response.data {
                    self.manager.parseJSONData(data)
                }
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        
        
        let itemArray = manager.loadJSONData("ADView")
        
        for item in itemArray {
            guard let name = item.name,
                    let left = item.left,
                    let top = item.top,
                    let width = item.width,
                    let height = item.height else { return }
            let wrapper = YNTControlWrapper(name: name, frame: CGRectMake(left, top, width, height), model: item)
            if let subview = wrapper.subView {
                subview.delegate = self
                view.addSubview(subview)
            }
        }
    }
}

