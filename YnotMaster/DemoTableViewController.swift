//
//  DemoTableViewController.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/12.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit

class DemoTableViewController: UIViewController {
    
    var tableView: UITableView?
    var showAD = false
    let imageArray = ["apple0", "apple1", "apple2", "apple3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None

        if showAD  {
            let sliderView = UISliderImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, 180), imageArray: ["","","",""])
            view.addSubview(sliderView)
        }else {
            
            tableView = UITableView(frame: CGRectMake(0, 0, view.frame.size.width, view.frame.size.height), style: .Plain)
            tableView?.delegate = self
            tableView?.registerNib(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "First Cell")
            tableView?.dataSource = self
            view.addSubview(tableView!)
        }


        
        // Do any additional setup after loading the view.
    }
}

extension DemoTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("First Cell", forIndexPath: indexPath) as? FirstTableViewCell {
            cell.headImageView?.image = UIImage(named: imageArray[indexPath.row % 4])
            return cell
        }else {
            return UITableViewCell()
        }
    }
}
