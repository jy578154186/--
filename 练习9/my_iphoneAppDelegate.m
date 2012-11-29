//
//  my_iphoneAppDelegate.m
//  练习9
//
//  Created by Ibokan on 12-9-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "my_iphoneAppDelegate.h"
#import "HomeViewController.h"
@implementation my_iphoneAppDelegate
@synthesize window = _window;
- (void)dealloc
{
    [_window release];
    [super dealloc];
}

/* 代理方法--应用程序启动时程序转入激活状态 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease]; //自适应屏幕大小
    // Override point for customization after application launch.翻译->覆盖点应用程序启动后定制。
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    NSLog(@"//应用程序转入激活状态");
   
    HomeViewController *homeView=[[HomeViewController alloc] init]; //创建view之前要添加头文件，这里没有frame也行自适应全屏
    homeView.view.backgroundColor=[UIColor grayColor];
//    [self.window addSubview:homeView.view];  //添加子类，把homeView加到window上
    self.window.rootViewController=homeView;  //要给[homeView release];
    [homeView release];
    
//    [UIApplication sharedApplication].statusBarHidden=YES ;  //隐藏屏幕最上面的状态栏,[UIApplication sharedApplication]得到当前的Application
    return YES;
}

/* 点击HOME键将要进入（后台）应用程序从激活状态转入（非激活）状态 */
- (void)applicationWillResignActive:(UIApplication *)application  
{
/*    
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
*/
         NSLog(@"应用程序从激活状态转入非激活状态");
}

/* 已经进入（后台）非激活状态 默认设置为NO，设为YES才能实现*/
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
    NSLog(@"//应用程序从激活状态转入（非激活）状态(点击HOME键)");
}
/*  点击程序，将要进入（前台）激活状态 */
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

/* 已经进入前台激活状态 */
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

/* 应用程序终止时 */
- (void)applicationWillTerminate:(UIApplication *)application        
{
     /*    
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
    */ 
     NSLog(@"应用程序终止时");
}

@end
