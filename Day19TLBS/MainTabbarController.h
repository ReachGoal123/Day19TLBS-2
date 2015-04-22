//
//  MainTabbarController.h
//  Day19TLBS
//
//  Created by tarena on 15-3-4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
@interface MainTabbarController : UITabBarController<ICSDrawerControllerChild, ICSDrawerControllerPresenting>

@end
