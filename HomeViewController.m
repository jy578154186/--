//
//  HomeViewController.m
//  练习9
//
//  Created by Ibokan on 12-9-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

/*
 UIApplecation:继承于UIReponder，实现了UIApplecationDelegate代理。
 每个应用程序都有一个UIApplecation或子类型的实例。
 [UIApplication sharedApplication].statusBarHidden=YES ;  //隐藏屏幕最上面的状态栏,[UIApplication sharedApplication]得到当前的Application
 
 UIViewController试图控制器，每个视图控制器自带一个视图，并且负责显示这个视图。管理相关的Model和View（与Controller不同）。
 UIViewController能检测以及处理设备旋转苹果键+->键。能够检测和处理内存警告。
 UIViewController是所有视图控制器的父类，定义了视图控制器的基本功能。
 
 window是view的根目录。
 view表示屏幕上的一块矩形区域，他在app中占有绝对重要地位，负责渲染矩形内部的内容，并且响应区域发生的触摸事件。
 父视图 addsubview：子视图，一个视图只能有一个父视图，可以有0或多个子视图。同为子视图，越晚加入的视图月在上层。
 -（UIView*）viewWithTag:(NSInteger)tag可以给每个视图的tag付一个值，以便快速从所有的子视图中找到该视图。
 -(void)UIViewdidApear 为视图出现后调用的方法，另外还有视图将要出现时调用，视图将要关闭时调用，视图关闭后调用
 
 程序执行的顺序是：- (void)loadView-->- (void)viewDidLoad--> initWithNibName:
*/

#import "HomeViewController.h"

@implementation HomeViewController
@synthesize view1,view2,view3;

/* 初始化 */
- (id)initWithNibName:(NSString *)nibNameOrNil  bundle:(NSBundle *)nibBundleOrNil  
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        view1=[[UIView alloc] initWithFrame:CGRectMake(50, 50, 220, 220)];
        view1.backgroundColor=[UIColor blueColor];
        [self.view addSubview:view1];
//        view1.hidden=YES;    //将view1隐藏
        [view1 release];  //子视图添加到父视图之后就可以release
       
        view2=[[UIView alloc] initWithFrame:CGRectMake(30, 30,160, 160)];
        view2.backgroundColor=[UIColor greenColor];
        view2.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin; //设置子视图跟随父视图自动变化宽高、上下左右的边距   
        [view1 addSubview:view2]; 
        [view2 release];
        
        view3=[[UIView alloc] initWithFrame:CGRectMake(30, 30, 100, 100)];
        view3.backgroundColor=[UIColor redColor];
        view3.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
        [view2 addSubview:view3];
        [view3 release];
        
        UIButton *button1=[UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame=CGRectMake(30, 420, 30, 30);
        button1.tag=1;
//        button1.backgroundColor=[UIColor greenColor];
        [button1 setTitle:@"大" forState:UIControlStateNormal];
       
        /* setImage:会覆盖title，setBackgroundImage:不覆盖title。设置背景图片时，button的定义buttonWithType:UIButtonTypeCustom */
        [button1 setImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(up:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button1];
        
        UIButton *button2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        button2.frame=CGRectMake(130, 420, 30, 30);
        button2.tag=2;
//        button2.backgroundColor=[UIColor greenColor];
        [button2 setTitle:@"小" forState:UIControlStateNormal];
        [button2 setTitleColor:[UIColor redColor] forState:UIButtonTypeCustom];  //设置字体颜色
//        [button1 setBackgroundImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateNormal]; 
        [button2 addTarget:self action:@selector(up:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button2];
   
        UIButton *button3=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        button3.frame=CGRectMake(230, 420, 30, 30);
        button3.tag=3;
//        button3.backgroundColor=[UIColor greenColor];
        [button3 setTitle:@"翻" forState:UIControlStateNormal];
        [button3 setTitleColor:[UIColor redColor] forState:UIButtonTypeCustom];
        [button3 addTarget:self action:@selector(doButton3) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button3];
    }
    return self;
}

-(void)up:(id)x  
{
    if ([x tag]==1) {  
    //下面是一个动画块，给放大缩小添加动画效果
    [UIView beginAnimations:nil context:nil];    //动画开始
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut]; //增加动画执行效果 
    [UIView setAnimationDuration:2]; //动画持续的时间
        
    /*动画效果为将view1放大，原点坐标上移同时宽高也增大*/
    [view1 setFrame:CGRectInset(view1.frame, -10, -10)];    
    NSLog(@"==%@==",NSStringFromCGRect(view1.frame));  //输出点坐标，坐标原点逐渐减10，宽高加10
    
    [UIView commitAnimations];  //动画结束
    }else{
        [UIView beginAnimations:nil context:nil];
        view1.frame=CGRectInset(view1.frame, +10, +10);
        [UIView setAnimationDuration:2];
        [UIView commitAnimations];  
    }
}

-(void)doButton3{
    [UIView beginAnimations:@"Curl"context:nil]; //添加翻页效果,curl关键字是翻页效果 
    [UIView setAnimationDuration:2]; //动画持续时间  
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut]; //增加动画执行效果 
    [UIView setAnimationTransition: UIViewAnimationTransitionCurlUp //这个参数设置翻页效果从下向上翻
                                            forView:view1  
                                                cache:YES];  
    [UIView commitAnimations]; 
}

/* 发起内存警告三级警告后自动关闭程序删除内存（三级警告:应用程序使用内存超过一级10M,二级20M,三级30M） */
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

/* 用于管理方法固定格式.开始：#pragma mark - (自定义名称)   结束：#pragma mark  Initialization */
#pragma mark - View lifecycle  

/* 视图加载中，在这里要用self.view必须用alloc创建，一般不能用nib */
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView       
{
    self.view=[[[UIView alloc] init] autorelease];
    NSLog(@"loadView");
}

/* 建议程序写在这里，视图加载完成，nib一般用这个，在这里可以直接用self.view不用alloc创建 */
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad  {
    [super viewDidLoad];
    
    UIButton *tempbutton=[UIButton buttonWithType:1];
    [self.view addSubview:tempbutton]; //如果- (void)loadView开启并且没有给self.view赋值，这里直接使用self.view就会报错
    
    /* buttonframe.origin是只读的，我们要改变它，用下面的方法 */
    UIButton *btn=[UIButton buttonWithType:1];
    btn.frame=CGRectMake(100, 300, 50, 50 );
    [btn setTitle:@"btn" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnMove:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnMove:(UIButton * )sender{
    sender.frame=CGRectMake(200, 300, sender.frame.size.width, sender.frame.size.height);
}

/* 视图没有加载成功 */
- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    NSLog(@"viewDidUnload");
}

/* 处理设备旋转 */
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation //interfaceOrientation 朝向（只读属性）
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);   //参数为一个共用体里面有四个元素,横着倒着
}

@end
