//
//  Protocol.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/23.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import Foundation

protocol YNTControlClickProtocol: class {
    func imageTap(view:UIView, url: String, flag: String)
    func tableViewRowSelect(view: UIView, indexPath: NSIndexPath, flag: String)
    func collectionViewRowSelect(view: UIView, indexPath: NSIndexPath, flag: String)
}

extension YNTControlClickProtocol {
    func imageTap(view:UIView, url: String, flag: String) {
        let vc = viewController(view)
        let firstVC = WebViewController()
        vc?.navigationController?.pushViewController(firstVC, animated: true)
    }
    
    func tableViewRowSelect(view: UIView, indexPath: NSIndexPath, flag: String) {
        let vc = viewController(view)
        let firstVC = DemoViewController()
        vc?.presentViewController(firstVC, animated: true, completion: nil)
    }
    
    func collectionViewRowSelect(view: UIView, indexPath: NSIndexPath, flag: String) {
        let vc = viewController(view)
        let firstVC = DemoViewController()
        vc?.presentViewController(firstVC, animated: true, completion: nil)
    }
}
