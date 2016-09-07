//
//  YNSlideADView.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/22.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit
import SwiftyJSON

class YNTSliderADView: YNTControlWrapper {
    
    var itemArray = [ADModel]()
    var scrollView: UIScrollView?
    var pageControl: UIPageControl?
    
    var currentModel: ADModel {
        get {
            return itemArray[self.pageControl!.currentPage]
        }
    }
    
    convenience init(frame: CGRect, itemArray: [JSON]) {
        self.init(frame: frame)
        self.itemArray = itemArray.flatMap({ (itemDic: JSON) -> ADModel? in
            let model = ADModel(name: itemDic["name"].stringValue, imgURL: itemDic["imgURL"].stringValue, url: itemDic["url"].stringValue)
            return model
        })
        
        self.scrollView = UIScrollView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        self.scrollView?.contentSize = CGSizeMake(frame.size.width * CGFloat(itemArray.count), frame.size.height)
        self.scrollView?.pagingEnabled = true
        self.scrollView?.showsVerticalScrollIndicator = false
        self.scrollView?.showsHorizontalScrollIndicator = false
        self.scrollView?.delegate = self
        self.addSubview(self.scrollView!)
        self.pageControl = UIPageControl(frame: CGRectMake(0, frame.size.height - 20, frame.size.width, 10))
        self.pageControl?.currentPageIndicatorTintColor = UIColor.orangeColor()
        self.pageControl?.pageIndicatorTintColor = UIColor.whiteColor()
        self.pageControl?.numberOfPages = self.itemArray.count
        self.addSubview(self.pageControl!)
        
        setupImage(self.itemArray)
    }
    
    func setupImage(itemArray: [ADModel]) {
        for (index, model) in itemArray.enumerate() {
            let imageView = UIImageView(frame: CGRectMake(frame.size.width * CGFloat(index), 0, frame.size.width, frame.size.height))
            imageView.userInteractionEnabled = true
            imageView.sd_setImageWithURL(NSURL(string: model.imgURL), placeholderImage: UIImage(named: "apple\(index)"))
            let tap = UITapGestureRecognizer(target: self, action: #selector(YNTSliderADView.imageTap(_:)))
            imageView.addGestureRecognizer(tap)
            scrollView?.addSubview(imageView)
        }
    }
}

// MARK: -----Target Action

extension YNTSliderADView {
    
    //通用view与业务逻辑的冲突，是否用面向接口解决？
    func imageTap(ges: UITapGestureRecognizer) {
        delegate?.imageTap(self, url: "", flag: "")
    }

}

// MARK: ------ScrollView Delegate

extension YNTSliderADView: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.pageControl?.currentPage = Int(scrollView.contentOffset.x / frame.size.width)
    }
}
