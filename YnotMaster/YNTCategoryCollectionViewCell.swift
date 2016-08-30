//
//  NPCategoryCollectionViewCell.swift
//  BROnlineLearning
//
//  Created by bori－applepc on 16/5/31.
//  Copyright © 2016年 Bori Information Technology Co., Ltd. All rights reserved.
//

import UIKit

class YNTCategoryCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.whiteColor()
        categoryButton.userInteractionEnabled = false
        // Initialization code
    }
    
    

}
