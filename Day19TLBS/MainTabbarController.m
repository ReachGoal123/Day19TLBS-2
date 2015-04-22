//
//  MainTabbarController.m
//  Day19TLBS
//
//  Created by tarena on 15-3-4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MainTabbarController.h"

@interface MainTabbarController ()

@end

@implementation MainTabbarController

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
