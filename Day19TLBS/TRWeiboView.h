//
//  TRWeiboView.h
//  TLBS
//
//  Created by tarena on 15-1-22.
//  Copyright (c) 2015年 TR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRWeibo.h"
@interface TRWeiboView : UIView
@property (nonatomic, strong)TRWeibo *weibo;
@property (nonatomic)BOOL isDetail;
@property (nonatomic, strong)UITextView *textView;
@property (nonatomic, strong)UIImageView *imageView;

@end
