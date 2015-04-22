//
//  WeiboApi.m
//  Day17WeiboLogin
//
//  Created by tarena on 15-3-3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//
#define kAppKey @"284988187"
#define kAppSecret @"bff1c21e31229b68578dae140437bc11"
#define kAppURI @"https://api.weibo.com/oauth2/default.html"
#import "TRUserInfo.h"
#import "WeiboApi.h"
#import "TRJsonParser.h"
#import "AFNetworking.h"
@implementation WeiboApi
+(void)requestTokenWithCode:(NSString *)code andCallback:(MyCallback)callback{
    NSString *path = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/access_token"];
    NSString *params = [NSString stringWithFormat:@"client_id=%@&client_secret=%@&grant_type=authorization_code&code=%@&redirect_uri=%@",kAppKey,kAppSecret,code,kAppURI];
    NSLog(@"%@",path);
    NSMutableURLRequest *request= [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        callback(dic);
        NSLog(@"登陆成功 token=%@",[dic objectForKey:@"access_token"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"登陆失败");
    }];
    [operation start];
    
}
+(void)sendWeiboWithText:(NSString *)text andCallback:(MyCallback)callback{
    
    NSString *path = @"https://api.weibo.com/2/statuses/update.json";
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    NSString *params = [NSString stringWithFormat:@"access_token=%@&status=%@",token,text];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        callback(dic);
        NSLog(@"发送成功%@",dic);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发送失败");
    }];
    [operation start];
}


+(void)sendWeiboWithText:(NSString *)text andImageData:(NSData *)imageData andCallback:(MyCallback)callback{
    
    NSString *path = @"https://api.weibo.com/2/statuses/upload.json";
    
    //把请求参数放到字典当中
    NSString *token = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
    NSDictionary *params = @{@"access_token":token,@"status":text};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //响应数据的序列化
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:imageData name:@"pic" fileName:@"abc.jpg" mimeType:@"image/jpg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        callback(dic);
        NSLog(@"发送成功：%@",dic);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发送带图失败");
    }];
    
  
    
}

+(void)requestUserInfoByUserID:(NSString *)userID andCallback:(MyCallback)callback{
    NSString *path = @"https://api.weibo.com/2/users/show.json";
    NSString *token = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
    NSDictionary *params = @{@"access_token": token,@"uid":userID};
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        //        NSLog(@"请求成功：%@",dic);
        TRUserInfo *userInfo = [TRJsonParser paseUserInfoByDictionary:dic];
        callback(userInfo);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发送失败");
    }];
}

+(void)requestTimelineWithUserID:(NSString *)openID andCallBack:(MyCallback)callback{
    
    
    NSString *path = @"https://api.weibo.com/2/statuses/user_timeline.json";
    NSString *token = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
    NSDictionary *params = @{@"access_token":token,@"uid":openID,};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *weibosDic = [dic objectForKey:@"statuses"];
        
        NSMutableArray *weibos = [NSMutableArray array];
        for (NSDictionary *weiboDic in weibosDic) {
            TRWeibo *w = [TRJsonParser paseWeiboByDictionary:weiboDic];
            [weibos addObject:w];
        }
        callback(weibos);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发送失败");
    }];
    
}

@end
