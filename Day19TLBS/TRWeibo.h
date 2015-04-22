//
//  Weibo.h
//  Day10WeiboDemo
//
//  Created by apple on 13-11-26.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRUserInfo.h"
#import <MapKit/MapKit.h>
@interface TRWeibo : NSObject


@property (nonatomic)BOOL isRepost;//是转发的微博
@property (nonatomic)CLLocationCoordinate2D coord;
@property(nonatomic,copy)NSString           *createDate;        //微博的创建时间
@property(nonatomic,copy)NSString           *weiboId;           //微博id
@property(nonatomic,copy)NSString           *text;              //微博内容
@property(nonatomic,copy)NSString           *source;            //微博来源
@property(nonatomic,copy)NSString           *thumbnailImage;    //缩略图片地址，没有时不返回此字段

@property(nonatomic,strong)TRWeibo       *relWeibo;          //被转发的原微博
@property(nonatomic,strong)TRUserInfo        *user;              //微博的作者用户
@property (nonatomic, copy)NSString *location;
//微博经纬度
@property(nonatomic,copy)NSString *latitude;
@property(nonatomic,copy)NSString *longitude;
@property (nonatomic, copy)NSString *count;
@property (nonatomic, copy)NSString *mCount;
//实现这个方法 计算微博高度
-(float)getWeiboHeightIsDetailPage:(BOOL)isDitail;
@end

