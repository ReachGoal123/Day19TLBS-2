//
//  UserInfo.h
//  Day10WeiboDemo
//
//  Created by apple on 13-11-25.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRUserInfo : NSObject
@property(nonatomic,copy)NSString *uid;           //字符串型的用户UID
@property(nonatomic,copy)NSString *name;     //用户名称
@property(nonatomic,copy)NSString *nick;            //昵称
@property(nonatomic,copy)NSString *location;        //用户所在地
@property(nonatomic,copy)NSString *introduction;     //用户个人描述
@property(nonatomic,copy)NSString * head;  //用户头像地址，100×100像素
@property(nonatomic,copy)NSString * sex;             //性别，m：男、f：女、n：未知
@property(nonatomic,copy)NSString* createTime;        //生日
@property(nonatomic,copy)NSString* age;             //年龄
@property(nonatomic,copy)NSString* company;         //公司




@end
