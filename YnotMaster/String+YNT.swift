//
//  String+YNT.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/28.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import Foundation

extension String {
    
    subscript (r: Range<Int>) -> String {
        
        get {
            let startIndex = self.startIndex.advancedBy(r.startIndex)
            let endIndex = self.startIndex.advancedBy(r.endIndex)
            
            return self[startIndex..<endIndex]
        }
        
    }
}