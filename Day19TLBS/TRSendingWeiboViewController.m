//
//  TRSendingWeiboViewController.m
//  TLBS-Project
//
//  Created by LIU XU on 13-12-22.
//  Copyright (c) 2013年 Wei WenRu. All rights reserved.
//
#import "TRSendingWeiboViewController.h"
#import "AppDelegate.h"
#import "WeiboApi.h"
@interface TRSendingWeiboViewController ()
@property (weak, nonatomic) IBOutlet UILabel *latiLabel;
@property (weak, nonatomic) IBOutlet UILabel *longLabel;
@property (nonatomic, strong)NSData *imageData;
@property (nonatomic, weak)AppDelegate *app;
@property (nonatomic, strong)UIAlertView *waitAV;

@end

@implementation TRSendingWeiboViewController

- (IBAction)SendWeibo:(id)sender {

    self.waitAV = [[UIAlertView alloc]initWithTitle:@"正在发送请稍后。。。" message:Nil delegate:Nil cancelButtonTitle:Nil otherButtonTitles:Nil, nil];
    [self.waitAV show];
    if (self.imageData) {//带图微博
      
        [WeiboApi sendWeiboWithText:self.sendInfoTV.text andImageData:self.imageData andCallback:^(id obj) {
           
            
            [self.waitAV dismissWithClickedButtonIndex:0 animated:YES];
             [self.navigationController popViewControllerAnimated:YES];
        }];
        
    }else{//纯文本微博
        
        [WeiboApi sendWeiboWithText:self.sendInfoTV.text andCallback:^(id obj) {
            
            
            [self.waitAV dismissWithClickedButtonIndex:0 animated:YES];
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }
    
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)addImage:(id)sender {
    UIActionSheet *as = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"打开照相机" otherButtonTitles:@"从手机相册获取", nil];
    [as showInView:self.view];
    
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    NSString *url = [[info objectForKey:UIImagePickerControllerReferenceURL] description];
    
    //    把UIImage转成Data
    if ([url hasSuffix:@"JPG"]) {
        //    把UIImage转成Data
        self.imageData =  UIImageJPEGRepresentation(image, 1);
    }else{//PNG
        self.imageData = UIImagePNGRepresentation(image);
    }
    self.selectedIV.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)viewDidLoad{
  
    [super viewDidLoad];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (buttonIndex) {
        case 0:{
            
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
                [ipc setSourceType:UIImagePickerControllerSourceTypeCamera];
                ipc.delegate = self;
                ipc.allowsEditing = YES;
                [self presentViewController:ipc animated:YES completion:nil];
            }else{
                NSLog(@"这设备没相机");
            }
            
        }
            
            break;
            
        case 1:{
            UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
            [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            ipc.delegate = self;
            ipc.allowsEditing = YES;
            [self presentViewController:ipc animated:YES completion:nil];
        }
            break;
    }
}
- (IBAction)mapAction:(id)sender {

}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text hasPrefix:@"说说今天"]) {
        textView.text = @"";
    }
    [textView setTextColor:[UIColor blackColor]];
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
      [self.navigationController popViewControllerAnimated:YES];
}



@end
