//
//  HomeViewController.h
//  练习9
//
//  Created by Ibokan on 12-9-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
{
    const CGFloat *color;  //可以理解为指向浮点型指针，相当于浮点型数组。对比字符数组和字符指针理解
}
@property(retain,nonatomic)UIView *view1,*view2,*view3;
@end
