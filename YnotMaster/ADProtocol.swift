//
//  Protocol.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/23.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import Foundation

protocol ADProtocol: class {
    func imageTap(view:UIView, url: String, flag: String)
}

extension ADProtocol {
    func imageTap(view:UIView, url: String, flag: String) {
        let vc = viewController(view)
        let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("First")
        vc?.navigationController?.pushViewController(firstVC, animated: true)
    }
}
