//
//  TestView.m
//  YnotMaster
//
//  Created by bori－applepc on 16/6/20.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

#import "TestView.h"

@interface TestView()
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation TestView
@synthesize imageArray = _imageArray;
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self addSubview:self.scrollView];
//        [self setupImage];
    }
    return self;
}

-(void)setupImage{
    for (int i = 0;i < self.imageArray.count;i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width * i, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
//        [imageView sd_setImageWithURL:[NSURL URLWithString:self.imageArray[i]] placeholderImage:[UIImage imageNamed:@"apple0"]];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"apple%d", i]];
        [self.scrollView addSubview:imageView];
    }
}


-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
        _scrollView.contentSize = CGSizeMake(self.frame.size.width * self.imageArray.count, self.frame.size.height);
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

-(void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    [self addSubview:self.scrollView];
    [self setupImage];
}

//-(NSArray *)imageArray{
//    if (!imageArray) {
//        imageArray = @[@"http://58.67.151.250:7051/MobileELearning/WebFiles/perphoto/c22ad179-34d5-4c4f-99df-158ee1d68583.jpg", @"http://58.67.151.250:7051/MobileELearning/WebFiles/perphoto/0165c70c-dd0c-47b9-b372-9e07dabbc272.png", @"http://58.67.151.250:7051/MobileELearning/WebFiles/perphoto/4a83a39a-146b-4a76-b605-3aafe51dc4e3.jpg", @"http://58.67.151.250:7051/MobileELearning/WebFiles/perphoto/e9e9cde6-9cdf-47c4-80fe-3bc0fb1b2caf.jpg"];
//    }
//    return imageArray;
//}

@end
