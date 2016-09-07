//
//  AppDelegate.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/4.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let tabbar = UITabBarController()
//        
//        Alamofire.request(.GET, "http://58.67.151.250:7051/MobileELearning/andorid/AnCourseWare!MobileTypes.do?&Mode=6&clientCode=bori&deviceType=iphone&userID=15833&version=1.0.0.0", parameters: nil)
//            .responseJSON { response in
//                
//                if let data = response.data {
//                    let json = JSON(data: data)
//                    let itemArray = json["items"].arrayValue
//                    for dic in itemArray {
//                        let model = YNTabbarModel(title: dic["title"].stringValue, image: dic["image"].stringValue, selectedImage: dic["selectedImage"].stringValue, config: dic["config"].stringValue)
//                        let vc = ViewController()
//                        vc.tabBarItem.title = model.title
//                        vc.tabBarItem.image = UIImage(named: model.image)
//                        vc.tabBarItem.selectedImage = UIImage(named: model.selectedImage)
//                        vc.config = model.config
//                        let nav = UINavigationController(rootViewController: vc)
//                        tabbar.addChildViewController(nav)
//                    }
//                    let window = UIApplication.sharedApplication().delegate!.window!
//                    window?.rootViewController = tabbar
//                    window?.becomeKeyWindow()
//                    
//                }
//                
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                }
//        }
//        
//        let vc = FirstLaunchViewController()
//        window?.rootViewController = vc
//        window?.makeKeyAndVisible()
        
        
        // 暂时只能写死tabbar的item数量，不能从后台加载
        let identifierArray = ["ADView", "CategoryView"]
        for index in 0 ..< 2 {
            let vc = ViewController()
            vc.tabBarItem.title = "hey"
            vc.identifier = identifierArray[index]
            vc.tabBarItem.image = UIImage(named: "category2")
            vc.tabBarItem.selectedImage = UIImage(named: "category1")
            let nav = UINavigationController(rootViewController: vc)
            tabbar.addChildViewController(nav)
        }

        window?.rootViewController = tabbar
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

func viewController(view: UIView) -> UIViewController? {
    for(var next = view.superview;(next != nil);next = next?.superview) {
        let nextResponder = next?.nextResponder()
        if ((nextResponder?.isKindOfClass(UIViewController.self)) != nil) {
            let responder = nextResponder as? UIViewController
            return responder
        }
    }
    return nil
}

struct Window {
    static let SCREENWIDTH = UIScreen.mainScreen().bounds.width
    static let SCREENHEIGHT = UIScreen.mainScreen().bounds.height
}

