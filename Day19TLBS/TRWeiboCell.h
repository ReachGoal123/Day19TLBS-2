//
//  TRWeiboCell.h
//  TLBS
//
//  Created by tarena on 14-9-22.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRWeibo.h"
#import "TRWeiboView.h"
@interface TRWeiboCell : UITableViewCell
@property (nonatomic, strong)TRWeiboView *weiboView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nick;
@property (weak, nonatomic) IBOutlet UILabel *topicTime;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UIButton *transNums;
@property (weak, nonatomic) IBOutlet UIButton *commentNum;
@property(nonatomic,strong)TRWeibo * weibo;
@end
