//
//  MyNavigationController.m
//  Day19TLBS
//
//  Created by tarena on 15-3-4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyNavigationController.h"
#import "LoginViewController.h"
@interface MyNavigationController ()

@end

@implementation MyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"01全部话题_01.png"] forBarMetrics:UIBarMetricsDefault];

}
-(void)viewDidAppear:(BOOL)animated{
    
    //判断有没有登陆 没有的话 弹出登陆页面
    NSString *token = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
    
    if (!token) {
        LoginViewController *lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"loginvc"];
        
        [self presentViewController:lvc animated:YES completion:nil];
        
    }
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
