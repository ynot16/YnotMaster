//
//  YNEightCategoryView.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/28.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit
import SwiftyJSON

class YNTEigthCategoryView: YNTControlWrapper {
    
    var collectionView: UICollectionView?
    var itemArray = [EightCategoryModel]()
    let imageArray = ["category1", "category2", "category3", "category4", "category5", "category6", "category8", "category7"]
    
    convenience init(frame: CGRect, itemArray:[JSON]) {
        self.init(frame: frame)
        
        self.itemArray = itemArray.flatMap({ (itemDic: JSON) -> EightCategoryModel? in
            let model = EightCategoryModel(title: itemDic["title"].stringValue)
            return model
        })
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(Window.SCREENWIDTH / 4, 85)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height), collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.registerNib(UINib(nibName: "YNTCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EightCategory Cell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        addSubview(collectionView!)        
    }
}

extension YNTEigthCategoryView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("EightCategory Cell", forIndexPath: indexPath) as? YNTCategoryCollectionViewCell {
            let model = itemArray[indexPath.row]
            cell.categoryButton.setBackgroundImage(UIImage(named: imageArray[indexPath.row % imageArray.count]), forState: .Normal)
            cell.categoryButton.setTitle(model.title[0..<1], forState: .Normal)
            if model.title == "全部" {
                cell.categoryButton.setTitle("...", forState: .Normal)
            }
//            cell.categoryButton.titleLabel?.font = UIFont(name: "hzgb", size: 24)
            cell.categoryLabel.text = (model.title as NSString).length > 4 ? model.title[0..<4] : model.title
            return cell
        }else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        delegate?.collectionViewRowSelect(self, indexPath: indexPath, flag: "")
    }
}
