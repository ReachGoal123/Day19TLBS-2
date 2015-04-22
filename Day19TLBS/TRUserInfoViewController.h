//
//  TRUserInfoViewController.h
//  TLBS
//
//  Created by tarena on 14-9-18.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRUserInfo.h"
#import "TRUserInfoView.h"
@interface TRUserInfoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;
@property (nonatomic, strong)TRUserInfo *userInfo;
@end
