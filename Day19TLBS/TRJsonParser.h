//
//  TRJsonParser.h
//  Day16TLBS
//
//  Created by tarena on 14-11-21.
//  Copyright (c) 2014年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRUserInfo.h"
#import "TRWeibo.h"
@interface TRJsonParser : NSObject
//解析个人信息
+(TRUserInfo*)paseUserInfoByDictionary:(NSDictionary*)dic;
//解析微博
+(TRWeibo*)paseWeiboByDictionary:(NSDictionary *)dic;


@end
