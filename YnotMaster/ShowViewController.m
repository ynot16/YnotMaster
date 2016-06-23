//
//  ShowViewController.m
//  YnotMaster
//
//  Created by bori－applepc on 16/6/20.
//  Copyright © 2016年 bori－applepc. All rights reserved.
//

#import "ShowViewController.h"
#import "TestView.h"

NSString * const test = @"test";

@implementation ShowViewController

-(void)viewDidLoad{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [super viewDidLoad];
    
    
    
    /**
     1.因为当前界面的控件都是动态的，所以只能通过字符串动态创建对应的类，并展示（但是仅仅是一个静态控件，无任何交互事件）。
     2.要给控件传参数，配置UI，但是因为这个控件是动态创建的，编译器无法知道这个控件有什么属性参数。可能解决方案：通过调用setter方法传参数。
     3.控件的点击事件捕捉。
     4.控件的delegate，datasource，如果不能知道该界面有这个控件，控件的delegate和datasource怎么处理。
     5.复杂view的布局
     
     业界动态部署方案
     1.（聚划算）luaView：通过lua语言连接到native的系统框架，服务器再发lua脚本，前端执行脚本
     2.react－native，JSPatch，通过JS与OC的交互，执行JS脚本，完成部署。JSPatch不能版本迭代。
     
     猜想
     通过解析后台配置文件，引入中间件，生成JS脚本，利用JSPatch完成部署。
     */
    NSArray *imageArray = @[@"http://58.67.151.250:7051/MobileELearning/WebFiles/perphoto/c22ad179-34d5-4c4f-99df-158ee1d68583.jpg", @"http://58.67.151.250:7051/MobileELearning/WebFiles/perphoto/0165c70c-dd0c-47b9-b372-9e07dabbc272.png", @"http://58.67.151.250:7051/MobileELearning/WebFiles/perphoto/4a83a39a-146b-4a76-b605-3aafe51dc4e3.jpg", @"http://58.67.151.250:7051/MobileELearning/WebFiles/perphoto/e9e9cde6-9cdf-47c4-80fe-3bc0fb1b2caf.jpg"];
    Class sliderView = NSClassFromString(@"TestView");
    id object = [[sliderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 180)];
    SEL selector = NSSelectorFromString(@"addSubview:");
    SEL imgSel = NSSelectorFromString(@"setImageArray:");
    if (class_respondsToSelector([object class], imgSel)) {
        [object performSelector:imgSel withObject:imageArray];
    }
    if ([self.view respondsToSelector:selector]) {
        [self.view performSelector:selector withObject:object];
    }
    
    
#pragma clang diagnostic pop
}



@end
