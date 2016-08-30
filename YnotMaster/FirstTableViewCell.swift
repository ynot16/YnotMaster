//
//  FirstTableViewCell.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/12.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit
import SnapKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstPropery: UILabel!
    @IBOutlet weak var secondProperty: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
