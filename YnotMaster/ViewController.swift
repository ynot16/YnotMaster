//
//  ViewController.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/4.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let tableArray = ["广告", "列表"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None
        
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("Demo Cell", forIndexPath: indexPath) as? UITableViewCell {
            cell.textLabel?.text = tableArray[indexPath.row]
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = DemoTableViewController()
        if indexPath.row == 0 {
            vc.showAD = true
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}