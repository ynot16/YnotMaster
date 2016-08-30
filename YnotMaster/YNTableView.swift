//
//  YNTableView.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/22.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit
import SwiftyJSON

class YNTTableView: YNTControlWrapper {
    
    var tableView: UITableView?
    let imageArray = ["apple0", "apple1", "apple2", "apple3"]
    var itemArray = [TableViewModel]()
    
    convenience init(frame: CGRect, itemArray:[JSON]) {
        self.init(frame: frame)
        
        self.itemArray = itemArray.flatMap({ (itemDic: JSON) -> TableViewModel? in
            let model = TableViewModel(imgURL: itemDic["imgURL"].stringValue, title: itemDic["title"].stringValue, time: itemDic["time"].stringValue, readTimes: itemDic["readTimes"].intValue)
            return model
        })
        
        tableView = UITableView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height), style: .Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
        tableView?.registerNib(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "First Cell")
        addSubview(tableView!)
    }
}

extension YNTTableView: UITableViewDelegate, UITableViewDataSource {
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
            print("cell constraints count == \(cell.constraints.count)")
            for constraint in cell.constraints {
                if constraint.firstAttribute == .Left {
                    print("hey i am the leading constraint")
                }
            }
            
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
        delegate?.tableViewRowSelect(self, indexPath: indexPath, flag: "")
    }
}
