//
//  TRUserInfoView.m
//  TLBS
//
//  Created by tarena on 14-9-18.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRUserInfoView.h"

@implementation TRUserInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.nameLabel.text = self.userInfo.name;
    self.nickLabel.text = self.userInfo.nick;
    self.birthLabel.text = self.userInfo.createTime;
    self.sexLabel.text = self.userInfo.sex;
    self.introLabel.text = self.userInfo.introduction;
    self.locationLabel.text = self.userInfo.location;
}

@end
