//
//  YNControlWrapper.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/22.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit

enum YNTControlType: String {
    case ADView = "ADView"
    case TableView = "TableView"
    case CategoryView = "CategoryView"
}

class YNTControlWrapper: UIView {
    var name: String?
    var model: WidgetItem?
    var subView: YNTControlWrapper?
    weak var delegate: YNTControlClickProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(name: String, frame:CGRect, model: WidgetItem) {
        self.init(frame: frame)
        self.name = name
        self.model = model

        createSubview(name)
    }
    
    func createSubview(name: String) {
        let controlType = YNTControlType(rawValue: name)
        switch controlType! {
        case .ADView:
            subView = YNTSliderADView(frame: frame, itemArray: model!.items!)
        case .TableView:
            subView = YNTTableView(frame: frame, itemArray: model!.items!)
        case .CategoryView:
            subView = YNTEigthCategoryView(frame: frame, itemArray: model!.items!)
        }
    }
}

