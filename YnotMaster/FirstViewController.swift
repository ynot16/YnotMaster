//
//  FirstViewController.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/12.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var adTopTf: UITextField!
    @IBOutlet weak var adLeftTf: UITextField!
    @IBOutlet weak var adBottomTf: UITextField!
    @IBOutlet weak var adRightTf: UITextField!
    
    let imageArray = ["apple0", "apple1", "apple2", "apple3"]

    
    @IBOutlet weak var tableTopTf: UITextField!
    @IBOutlet weak var tableLeftTf: UITextField!
    @IBOutlet weak var tableBottomTf: UITextField!
    @IBOutlet weak var tableRightTf: UITextField!
    @IBOutlet weak var tableSegmentControl: UISegmentedControl!
    var cellStyle: TableViewCellStyle = .styleOne
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.hideKeyboard(_:)))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    func hideKeyboard(gesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    enum TableViewCellStyle: Int {
        case styleOne, styleTwo, styleMixed
    }
    
    
    @IBAction func showADAction(sender: AnyObject) {
        
        let topString: NSString = (adTopTf.text != "" ? adTopTf.text : "0")!
        let topOffset = topString.floatValue
        let leftString: NSString = (adLeftTf.text != "" ? adLeftTf.text : "0")!
        let leftOffset = leftString.floatValue
        let bottomString: NSString = (adBottomTf.text != "" ? adBottomTf.text : "0")!
        let bottomOffset = bottomString.floatValue
        let rightString: NSString = (adRightTf.text != "" ? adRightTf.text : "0")!
        let rightOffset = rightString.floatValue
        
        let sliderView = UISliderImageView(frame: CGRectMake(CGFloat(leftOffset), CGFloat(topOffset) + 210, self.view.frame.size.width - CGFloat(leftOffset) - CGFloat(rightOffset), 180), imageArray: ["","","",""])
        view.addSubview(sliderView)
    }

    @IBAction func chooseStyleAction(sender: UISegmentedControl) {
         cellStyle = TableViewCellStyle(rawValue: sender.selectedSegmentIndex)!
    }
    
    @IBAction func showTableAction(sender: AnyObject) {
        let topString: NSString = (tableTopTf.text != "" ? tableTopTf.text : "0")!
        let topOffset = topString.floatValue
        let leftString: NSString = (tableLeftTf.text != "" ? tableLeftTf.text : "0")!
        let leftOffset = leftString.floatValue
        let bottomString: NSString = (tableBottomTf.text != "" ? tableBottomTf.text : "0")!
        let bottomOffset = bottomString.floatValue
        let rightString: NSString = (tableRightTf.text != "" ? tableRightTf.text : "0")!
        let rightOffset = rightString.floatValue
        
        let tableView = UITableView(frame: CGRectMake(CGFloat(leftOffset), CGFloat(topOffset) + 210, self.view.frame.size.width - CGFloat(leftOffset) - CGFloat(rightOffset), view.frame.size.height - CGFloat(topOffset) - 210), style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "First Cell")
        tableView.registerNib(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "Second Cell")
        view.addSubview(tableView)
    }
    
    @IBAction func removeADView(sender: AnyObject) {
        for vi in view.subviews {
            if vi.isKindOfClass(UISliderImageView.self) {
                vi.removeFromSuperview()
            }
        }
    }
    
    @IBAction func removeTableView(sender: AnyObject) {
        for vi in view.subviews {
            if vi.isKindOfClass(UITableView.self) {
                vi.removeFromSuperview()
            }
        }
    }
    
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch cellStyle {
        case .styleOne:
            return 90
        case .styleTwo:
            return 140
        case .styleMixed:
            return (indexPath.row / 2) % 2 == 0 ? 90 : 140
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch cellStyle {
        case .styleOne:
            if let cell = tableView.dequeueReusableCellWithIdentifier("First Cell", forIndexPath: indexPath) as? FirstTableViewCell {
                cell.headImageView?.image = UIImage(named: imageArray[indexPath.row % 4])
                return cell
            }else {
                return UITableViewCell()
            }
        case .styleTwo:
            if let cell = tableView.dequeueReusableCellWithIdentifier("Second Cell", forIndexPath: indexPath) as? SecondTableViewCell {
                return cell
            }else {
                return UITableViewCell()
            }
        case .styleMixed:
            if (indexPath.row / 2) % 2 == 0 {
                if let cell = tableView.dequeueReusableCellWithIdentifier("First Cell", forIndexPath: indexPath) as? FirstTableViewCell {
                    cell.headImageView?.image = UIImage(named: imageArray[indexPath.row % 4])
                    return cell
                }else {
                    return UITableViewCell()
                }
            }else {
                if let cell = tableView.dequeueReusableCellWithIdentifier("Second Cell", forIndexPath: indexPath) as? SecondTableViewCell {
                    return cell
                }else {
                    return UITableViewCell()
                }
            }
        }
    }
}







