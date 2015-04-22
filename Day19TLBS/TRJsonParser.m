//
//  TRJsonParser.m
//  Day16TLBS
//
//  Created by tarena on 14-11-21.
//  Copyright (c) 2014年 Tarena. All rights reserved.
//

#import "TRJsonParser.h"

@implementation TRJsonParser
+(TRUserInfo *)paseUserInfoByDictionary:(NSDictionary *)dic{
    
    TRUserInfo *user = [[TRUserInfo alloc]init];
    //头像图片
    user.head = [dic objectForKey:@"avatar_large"];
    //用户名称
    user.name = [dic objectForKey:@"name"];
    //昵称
    user.nick = [dic objectForKey:@"screen_name"];
    //用户id
    user.uid = [dic objectForKey:@"id"];
    //性别
    user.sex = [[dic objectForKey:@"gender"]isEqualToString:@"m"]?@"男":@"女";
    //地址
    user.location = [dic objectForKey:@"location"];
    //简介
    user.introduction = [dic objectForKey:@"description"];
    //注册日期
 
    user.createTime = [[[dic objectForKey:@"created_at"] componentsSeparatedByString:@"+"]firstObject];;
    
    return user;

}

//解析微博对象
+(TRWeibo *)paseWeiboByDictionary:(NSDictionary *)dic{
    TRWeibo *myWeibo = [[TRWeibo alloc]init];
    
    
    myWeibo.createDate = [TRJsonParser fomateString:[dic objectForKey:@"created_at"]];
    
    myWeibo.text = [dic objectForKey:@"text"];
    
    myWeibo.source = [dic objectForKey:@"source"];
    myWeibo.count = [NSString stringWithFormat:@"%@",[dic objectForKey:@"reposts_count"]];
    myWeibo.mCount = [NSString stringWithFormat:@"%@",[dic objectForKey:@"comments_count"]];
    NSDictionary *locationDic = [dic objectForKey:@"geo"];
    if (locationDic&&![locationDic isMemberOfClass:[NSNull class]]) {
        NSArray *coordArr = [locationDic objectForKey:@"coordinates"];
        CLLocationCoordinate2D coord;
        coord.latitude = [coordArr[0] doubleValue];
        coord.longitude = [coordArr[1]doubleValue];
        myWeibo.coord = coord;
        
    }
    
    
    myWeibo.thumbnailImage = [dic objectForKey:@"thumbnail_pic"];
    id weiboID  = [dic objectForKey:@"id"];
    myWeibo.weiboId = [NSString stringWithFormat:@"%@",weiboID];
    //获取用户信息
    NSDictionary *userDic = [dic objectForKey:@"user"];
    TRUserInfo *userInfo = [TRJsonParser paseUserInfoByDictionary:userDic];
    myWeibo.user = userInfo;
    
    NSDictionary *reWeiboDic = [dic objectForKey:@"retweeted_status"];
    //判断是否有转发
    if (reWeiboDic && ![reWeiboDic isMemberOfClass:[NSNull class]]) {
        
        //如果发现有转发 调用自身
        myWeibo.relWeibo = [TRJsonParser paseWeiboByDictionary:reWeiboDic];
        myWeibo.relWeibo.isRepost = YES;
    }
    return myWeibo;
}
//转换时间格式
+ (NSString *)fomateString:(NSString *)datestring {
    NSString *formatString = @"E MMM d HH:mm:ss Z yyyy";
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:formatString];
    NSDate *date = [format dateFromString:datestring];
    formatString = @"MM-dd HH:mm";
    [format setDateFormat:formatString];
    
    return [format stringFromDate:date];
}
@end

