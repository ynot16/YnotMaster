//
//  WidgetsParseManager.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/17.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit
import SwiftyJSON

struct WidgetItem {
    var name: String?
    var configuration: JSON?
    var position: JSON?
    var items: [JSON]?
    
    var style: String?
    var width: CGFloat?
    var height: CGFloat?
    
    var top: CGFloat?
    var left: CGFloat?
    var bottom: CGFloat?
    var right: CGFloat?
    
    mutating func transformConfigAndPosi() {
        width = CGFloat(configuration!["width"].floatValue) == 9999 ? Window.SCREENWIDTH : CGFloat(configuration!["width"].floatValue)
        height = CGFloat(configuration!["height"].floatValue) == 9999 ? Window.SCREENHEIGHT : CGFloat(configuration!["height"].floatValue)
        style = configuration!["style"].stringValue
        left = CGFloat(position!["left"].floatValue)
        top = CGFloat(position!["top"].floatValue)
        right = CGFloat(position!["right"].floatValue)
        bottom = CGFloat(position!["bottom"].floatValue)
    }
}



class WidgetsParseManager {
    
    func loadJSONData(fileName: String) -> [WidgetItem] {
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let json = JSON(data: data!)
        let widgets = json["widgets"].arrayValue
        return widgets.flatMap{(itemDic: JSON) -> WidgetItem? in
            var item = WidgetItem()
            guard let name = itemDic["name"].string,
                let config = itemDic["configuration"] as? JSON,
                let position = itemDic["position"] as? JSON,
                let items = itemDic["items"].array
                else { return nil }
            item.name = name
            item.configuration = config
            item.position = position
            item.items = items
            item.transformConfigAndPosi()
            return item
        }
    }
    
    func parseJSONData(data: NSData) -> [WidgetItem] {
        let json = JSON(data: data)
        let widgets = json["widgets"].arrayValue
        return widgets.flatMap{(itemDic: JSON) -> WidgetItem? in
            var item = WidgetItem()
            guard let name = itemDic["name"].string,
                let config = itemDic["configuration"] as? JSON,
                let position = itemDic["position"] as? JSON,
                let items = itemDic["items"].array
                else { return nil }
            item.name = name
            item.configuration = config
            item.position = position
            item.items = items
            item.transformConfigAndPosi()
            return item
        }
    }
    
}
