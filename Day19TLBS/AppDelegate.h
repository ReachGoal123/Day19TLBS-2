//
//  AppDelegate.h
//  Day19TLBS
//
//  Created by tarena on 15-3-4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
#import "MainTabbarController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong)ICSDrawerController *drawerController;
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong)MainTabbarController *mtc;

@end

