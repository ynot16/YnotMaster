//
//  FirstLaunchViewController.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/8/15.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FirstLaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabbar = UITabBarController()
        
        Alamofire.request(.GET, "http://58.67.151.250:7051/MobileELearning/andorid/AnCourseWare!MobileTypes.do?&Mode=6&clientCode=bori&deviceType=iphone&userID=15833&version=1.0.0.0", parameters: nil)
            .responseJSON { response in
                
                if let data = response.data {
                    let json = JSON(data: data)
                    let itemArray = json["items"].arrayValue
                    for dic in itemArray {
                        let model = YNTabbarModel(title: dic["title"].stringValue, image: dic["image"].stringValue, selectedImage: dic["selectedImage"].stringValue, config: dic["config"].stringValue)
                        let vc = ViewController()
                        vc.tabBarItem.title = model.title
                        vc.tabBarItem.image = UIImage(named: model.image)
                        vc.tabBarItem.selectedImage = UIImage(named: model.selectedImage)
                        vc.config = model.config
                        let nav = UINavigationController(rootViewController: vc)
                        tabbar.addChildViewController(nav)
                    }
                    let window = UIApplication.sharedApplication().delegate!.window!
                    window?.rootViewController = tabbar
                    window?.becomeKeyWindow()

                }
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        
        // Do any additional setup after loading the view.
    }
}
