//
//  TRUserInfoViewController.m
//  TLBS
//
//  Created by tarena on 14-9-18.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
#import "TRWeiboCell.h"
#import "TRWeibo.h"
#import "TRUserInfoViewController.h"
#import "UIImageView+AFNetworking.h"
#import "WeiboApi.h"

@interface TRUserInfoViewController ()
@property (nonatomic, strong)NSMutableArray *weibos;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet TRUserInfoView *userInfoView;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headIV;
@property (weak, nonatomic) IBOutlet UIImageView *redIV;
@end

@implementation TRUserInfoViewController


- (IBAction)clicked:(UIButton *)sender {
    //移动红色按钮
    CGRect frame = self.redIV.frame;
    frame.origin.x = 27+ sender.tag*165;
    [UIView animateWithDuration:.5 animations:^{
        self.redIV.frame = frame;
        
    }];
    self.tableView.hidden = sender.tag==0?YES:NO;
    //如果点击的是话题按钮
    if (sender.tag==1) {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        
        //发出获取用户所有微博的请求
      [WeiboApi requestTimelineWithUserID:[ud objectForKey:@"uid"] andCallBack:^(id obj) {
          self.weibos = obj;
          [self.tableView reloadData];
      }];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}



-(void)createUIByUserInfo:(TRUserInfo*)userInfo{
    
    self.userInfo = userInfo;
    //    因为基本资料里面的数据条目太多 所以用了一个自定义的View 单独处理它的显示
    self.userInfoView.userInfo = userInfo;
    [self.userInfoView setNeedsLayout];
    
    
    self.nickLabel.text = userInfo.nick;
    self.introLabel.text = userInfo.introduction;
    //设置图片
    self.headIV.layer.cornerRadius = self.headIV.bounds.size.width/2;
    self.headIV.layer.masksToBounds = YES;
    self.headIV.layer.borderColor = [UIColor whiteColor].CGColor;
    self.headIV.layer.borderWidth = 1.5;
    [self.headIV setImageWithURL:[NSURL URLWithString:userInfo.head]];
    
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = YES;
    
 
}
-(void)viewDidAppear:(BOOL)animated{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *uid = [ud objectForKey:@"uid"];
    //    获取个人信息
    [WeiboApi requestUserInfoByUserID:uid andCallback:^(id obj) {
        [self createUIByUserInfo:obj];
    }];
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.weibos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    TRWeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TRWeiboCell" owner:self options:nil]lastObject];
        
    }
    
    cell.weibo = self.weibos[indexPath.row];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TRWeibo *weibo = self.weibos[indexPath.row];
    
    return [weibo getWeiboHeightIsDetailPage:NO]+120;
}

@end
