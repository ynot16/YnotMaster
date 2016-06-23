//
//  FirstViewController.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/12.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit
import SwiftyJSON

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
    
    func loadLocalJsonData() {
        let manager = WidgetsParseManager()
        let itemArray = manager.loadJSONData()
        
        for item in itemArray {
            if item.name == "ADView" {
                var imgArray = [String]()
                for dic in item.items! {
                    let imgURL = dic["imgURL"].stringValue
                    imgArray.append(imgURL)
                }
                let sliderView = UISliderImageView(frame: CGRectMake(item.left!, item.top! + 210, view.frame.size.width, item.height!), imageArray: imgArray)
                view.addSubview(sliderView)
            }
            
            if item.name == "ListView" {
                let tableView = UITableView(frame: CGRectMake(item.left!, item.top! + 210, self.view.frame.size.width - item.left! - item.right!, view.frame.size.height - item.top! - 210), style: .Plain)
                tableView.delegate = self
                tableView.dataSource = self
                tableView.registerNib(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "First Cell")
                tableView.registerNib(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "Second Cell")
                view.addSubview(tableView)
            }
        }
    }

    func hideKeyboard(gesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    enum TableViewCellStyle: Int {
        case styleOne, styleTwo, styleMixed
    }
    
    
    @IBAction func showADAction(sender: AnyObject) {
        
        loadLocalJsonData()
        return
        /**
         加载解析json文件，获取对应参数
         */
        let path = NSBundle.mainBundle().pathForResource("ADView", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let json = JSON(data: data!)
        let widgets = json["widgets"].arrayValue
        
        for widgetDic in widgets {
            let width = CGFloat(widgetDic["configuration"]["width"].floatValue)
            let height = CGFloat(widgetDic["configuration"]["height"].floatValue)
            let left = CGFloat(widgetDic.floatValue)
            let top = CGFloat(widgetDic.floatValue)
            let right = CGFloat(widgetDic.floatValue)
        }
        
        let items = json["items"].arrayValue
        var imgArray = [String]()
        for dic in items {
            let imgURL = dic["imgURL"].stringValue
            imgArray.append(imgURL)
        }
        
        
        /**
         拿到解析的数据，创建控件
         */
//        let sliderView = UISliderImageView(frame: CGRectMake(left, top + 210, view.frame.size.width, height), imageArray: imgArray)
//        view.addSubview(sliderView)
//        
        /**
         目的：pm可以参与进来，通过拖拽控件，完成部分app界面布局。这样的话，要提供若干模版控件供pm选择。后台继而生成xml配置文件，前端通过请求解析获得json数据，继而加载相应控件。
         1、这样的流程其实跟原先一样，只是在原来纯数据展示之余，多了页面展示的参数（configuration之类）
         2、将多个控件组件化，通过请求的参数配置
         3、前提也要知道这个页面会展示哪些控件，而不是根据请求参数动态创建控件
         4、封装好解析类
         5、有一些控件可能不能通过这样方式配置，例如标签栏，如果是放在tableview的cell，或headerView上面（相当于控件里面包含控件）
         6、
         */
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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







