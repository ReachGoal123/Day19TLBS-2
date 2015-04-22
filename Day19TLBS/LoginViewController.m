//
//  LoginViewController.m
//  Day17WeiboLogin
//
//  Created by tarena on 15-3-3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "LoginViewController.h"
#import "WeiboApi.h"
@interface LoginViewController ()<UIWebViewDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *wv = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:wv];
    
    NSString *path = @"https://api.weibo.com/oauth2/authorize?client_id=284988187&redirect_uri=https://api.weibo.com/oauth2/default.html";
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    
    [wv loadRequest:request];
    
    wv.delegate = self;
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    
    NSString *path = [request.URL description];
    if ([path rangeOfString:@"code"].length>0) {
        NSString *code = [[path componentsSeparatedByString:@"="]lastObject];
        //发出获取token的请求
        [WeiboApi requestTokenWithCode:code andCallback:^(id obj) {
            
            NSString *token = [obj objectForKey:@"access_token"];
            NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
            //把token保存起来
            
            [ud setObject:token forKey:@"token"];
           
//            把当前用户id获取出来 并保存
            NSString *uid = [obj objectForKey:@"uid"];
            [ud setObject:uid forKey:@"uid"];
             [ud synchronize];
            if (token) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }];
    }
    NSLog(@"%@",path);
    return YES;
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
