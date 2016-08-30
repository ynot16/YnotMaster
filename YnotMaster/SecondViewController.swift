//
//  SecondViewController.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/28.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, YNTControlClickProtocol {

    var wrapper: YNTControlWrapper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None
        view.backgroundColor = UIColor.whiteColor()
        
        let manager = WidgetsParseManager()
        let itemArray = manager.loadJSONData("CategoryView")
        
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
