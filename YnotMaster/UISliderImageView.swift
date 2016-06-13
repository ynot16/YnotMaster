//
//  UISliderImageView.swift
//  YnotMaster
//
//  Created by bori－applepc on 16/6/7.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

import UIKit

protocol ImageViewTapDeleagte: class {
    func imageViewTap(gesture: UITapGestureRecognizer)
}

class UISliderImageView: UIView {
    
    var imageArray = [String]()
    var scrollView: UIScrollView?
    var pageControl: UIPageControl?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(frame: CGRect, imageArray: [String]) {
        self.init(frame: frame)
        self.imageArray = imageArray
        self.scrollView = UIScrollView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        self.scrollView?.contentSize = CGSizeMake(frame.size.width * CGFloat(imageArray.count), frame.size.height)
        self.scrollView?.pagingEnabled = true
        self.scrollView?.showsVerticalScrollIndicator = false
        self.scrollView?.showsHorizontalScrollIndicator = false
        self.scrollView?.delegate = self
        self.addSubview(self.scrollView!)
        self.pageControl = UIPageControl(frame: CGRectMake(0, frame.size.height - 20, frame.size.width, 10))
        self.pageControl?.currentPageIndicatorTintColor = UIColor.orangeColor()
        self.pageControl?.pageIndicatorTintColor = UIColor.whiteColor()
        self.pageControl?.numberOfPages = imageArray.count
        self.addSubview(self.pageControl!)
        
        setupImage(imageArray)
    }
    
    func setupImage(imageArray: [String]) {
        for (index, value) in imageArray.enumerate() {
            let imageView = UIImageView(frame: CGRectMake(frame.size.width * CGFloat(index), 0, frame.size.width, frame.size.height))
            imageView.sd_setImageWithURL(NSURL(string: value), placeholderImage: UIImage(named: "apple\(index)"))
            scrollView?.addSubview(imageView)
        }
    }    
}

extension UISliderImageView: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.pageControl?.currentPage = Int(scrollView.contentOffset.x / frame.size.width)
    }
}

