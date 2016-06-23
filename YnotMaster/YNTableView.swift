//
//  YNTableView.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/22.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit
import SwiftyJSON

class YNTableView: YNControlWrapper {
    
    var tableView: UITableView?
    let imageArray = ["apple0", "apple1", "apple2", "apple3"]
    var itemArray = [TableViewModel]()
    
    convenience init(frame: CGRect, itemArray:[JSON]) {
        self.init(frame: frame)
        
        self.itemArray = itemArray.flatMap({ (itemDic: JSON) -> TableViewModel? in
            let model = TableViewModel(imgURL: itemDic["imgURL"].stringValue, title: itemDic["title"].stringValue, time: itemDic["time"].stringValue, readTimes: itemDic["readTimes"].intValue)
            return model
        })
        
        tableView = UITableView(frame: frame, style: .Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.registerNib(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "First Cell")
        addSubview(tableView!)
    }
}

extension YNTableView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("First Cell", forIndexPath: indexPath) as? FirstTableViewCell {
            let model = itemArray[indexPath.row]
            cell.headImageView?.image = UIImage(named: imageArray[indexPath.row % 4])
            cell.titleLabel.text = model.title
            cell.firstPropery.text = String(model.readTimes)
            cell.secondProperty.text = model.time
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let vc = viewController(self)
        let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("First")
        vc?.navigationController?.pushViewController(firstVC, animated: true)        
    }
}
