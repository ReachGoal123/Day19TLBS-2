//
//  TRSendingWeiboViewController.h
//  TLBS-Project
//
//  Created by LIU XU on 13-12-22.
//  Copyright (c) 2013年 Wei WenRu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TRSendingWeiboViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *sendInfoTV;
@property (weak, nonatomic) IBOutlet UIImageView *selectedIV;
@property (nonatomic)CLLocationCoordinate2D coord;

 
@end
