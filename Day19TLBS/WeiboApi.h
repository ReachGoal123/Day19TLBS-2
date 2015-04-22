//
//  WeiboApi.h
//  Day17WeiboLogin
//
//  Created by tarena on 15-3-3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^MyCallback)(id obj);
@interface WeiboApi : NSObject

+(void)requestTokenWithCode:(NSString *)code andCallback:(MyCallback)callback;

+(void)sendWeiboWithText:(NSString *)text andCallback:(MyCallback)callback;

+(void)sendWeiboWithText:(NSString *)text andImageData:(NSData*)imageData andCallback:(MyCallback)callback;

//个人信息
+(void)requestUserInfoByUserID:(NSString *)userID andCallback:(MyCallback)callback;
//查询某用户发布的最新微博
+(void)requestTimelineWithUserID:(NSString *)openID andCallBack:(MyCallback)callback;

@end
