//
//  CGRect+YNT.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/28.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import Foundation

extension CGRect {
    /// 返回 Rect 的 Center 位置
    var center: CGPoint {
        get {
            return CGPoint(x: size.width / 2, y: size.height / 2)
        }
        set {
            self.origin = CGPoint(x: newValue.x - size.width / 2, y: newValue.y - size.height / 2)
        }
    }
    
    var bottom: CGFloat {
        return self.origin.y + self.size.height
    }
    
    var right: CGFloat {
        return self.origin.x + self.size.width
    }
    
    var x: CGFloat {
        return self.origin.x
    }
    
    var y: CGFloat {
        return self.origin.y
    }
    
    var width: CGFloat {
        return self.size.width
    }
    
    var height: CGFloat {
        return self.size.height
    }
    
}