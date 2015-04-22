//
//  TRWeiboCell.m
//  TLBS
//
//  Created by tarena on 14-9-22.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRWeiboCell.h"
#import "UIImageView+AFNetworking.h"
@implementation TRWeiboCell

 
//当控件是通过xib或storyboard创建出来时调用子控件为创建好了
-(void)awakeFromNib{
 
    [super awakeFromNib];
//****************************
//把WeiboView添加到界面
    self.weiboView = [[TRWeiboView alloc]initWithFrame:CGRectZero];
    [self addSubview:self.weiboView];
//****************************
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
//千万不能在此方法中创建控件
-(void)layoutSubviews{
    [super layoutSubviews];
    self.nick.text = self.weibo.user.nick;
    self.topicTime.text = self.weibo.createDate;
    self.address.text = self.weibo.location;
    [self.commentNum setTitle:self.weibo.mCount forState:UIControlStateNormal];
    [self.transNums setTitle:self.weibo.count forState:UIControlStateNormal];
    
     [self.headImageView setImageWithURL:[NSURL URLWithString:self.weibo.user.head]];
//****************************
     self.weiboView.weibo = self.weibo;
    //设置weiboView的尺寸
    self.weiboView.frame = CGRectMake(60, 30, 260, [self.weibo getWeiboHeightIsDetailPage:NO]);
    [self.weiboView setNeedsLayout];
//*****************************
}

@end
