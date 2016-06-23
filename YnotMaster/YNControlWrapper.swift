//
//  YNControlWrapper.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/22.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit

enum YNControlType: String {
    case ADView = "ADView"
    case TableView = "TableView"
}

class YNControlWrapper: UIView {
    var name: String?
    var model: WidgetItem?
    var subView: YNControlWrapper?
    weak var delegate: ADProtocol?
    
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
        let controlType = YNControlType(rawValue: name)
        switch controlType! {
        case .ADView:
            subView = YNSliderADView(frame: frame, itemArray: model!.items!)
        case .TableView:
            subView = YNTableView(frame: frame, itemArray: model!.items!)
        }
    }
}

