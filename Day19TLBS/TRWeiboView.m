//
//  TRWeiboView.m
//  TLBS
//
//  Created by tarena on 15-1-22.
//  Copyright (c) 2015年 TR. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "TRWeiboView.h"

@implementation TRWeiboView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       //此位置初始化用到的两个控件
        [self initUI];
    }
    return self;
}
//界面中添加控件
-(void)initUI{
    float width = 260;
    if (self.isDetail) {
        width = 320;
    }
    //    添加文本控件
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, width, 0)];
    self.textView.userInteractionEnabled = NO;
   
    self.textView.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.textView];
    self.textView.backgroundColor = [UIColor clearColor];
    //    添加图片控件
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, 90)];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
 
    [self addSubview:self.imageView];
}

-(void)layoutSubviews{
    [super layoutSubviews];
  
    //此位置写显示内容和更改尺寸的代码
    float width = 260;
    if (self.isDetail) {
        width = 320;
    }
    //计算文本高度
    CGRect frame = [self.weibo.text boundingRectWithSize:CGSizeMake(width, 999) options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil];
    self.textView.frame = CGRectMake(0, 0, width, frame.size.height+10);
//   设置显示的文本
    self.textView.text = self.weibo.text;
    //如果存在图片
    if (self.weibo.thumbnailImage && ![self.weibo.thumbnailImage isEqualToString:@""]) {
        self.imageView.hidden = NO;
        self.imageView.frame = CGRectMake(-20,self.textView.frame.size.height+10, width, 90);
        
        [self.imageView setImageWithURL:[NSURL URLWithString:self.weibo.thumbnailImage]];
    }else{//如果没有图片把图片隐藏
        self.imageView.hidden = YES;
    }
}
@end
