//
//  TRUserInfoView.h
//  TLBS
//
//  Created by tarena on 14-9-18.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRUserInfo.h"
@interface TRUserInfoView : UIView
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong)TRUserInfo *userInfo;
@end
