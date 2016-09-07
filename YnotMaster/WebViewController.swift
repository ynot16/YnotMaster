//
//  WebViewController.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/24.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    var url: String? = ""
    var nav: UINavigationController?
    
    lazy var webView: UIWebView = {
        let webView = UIWebView(frame: CGRectMake(0, 0, Window.SCREENWIDTH, Window.SCREENHEIGHT))
        webView.delegate = self
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.baidu.com")!))
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(webView)
    }
    
    
    deinit {
        print("i am deinit")
    }
}

extension WebViewController: UIWebViewDelegate {
    
    
}