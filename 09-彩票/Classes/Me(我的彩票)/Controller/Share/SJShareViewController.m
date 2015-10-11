//
//  SJShareViewController.m
//  09-彩票
//
//  Created by 朱仕俊 on 15/10/1.
//  Copyright © 2015年 朱仕俊. All rights reserved.
//

#import "SJShareViewController.h"
#import <MessageUI/MessageUI.h>

@interface SJShareViewController ()<MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate>

@end

@implementation SJShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.1.新浪微博
    SJSettingArrowItem *weibo = [[SJSettingArrowItem alloc] initWithIcon:@"WeiboSina" title:@"新浪微博"];
    
    // 1.2.短信分享
    SJSettingArrowItem *sms = [[SJSettingArrowItem alloc] initWithIcon:@"SmsShare" title:@"短信分享"];
    sms.option = ^{
        //弊端：不会返回应用程序界面
//        NSURL *url = [NSURL URLWithString:@"sms://10010"];
//        [[UIApplication sharedApplication] openURL:url];
        
        if(![MFMessageComposeViewController canSendText]){
            NSLog(@"当前设备不能发送短信");
            return;
        }
        
        MFMessageComposeViewController *vc = [[MFMessageComposeViewController alloc] init];
        //设置短信内容
        vc.body = @"吃饭了没？";
        //设置收件人列表
        vc.recipients = @[@"10010",@"02010010"];
        //设置代理
        vc.messageComposeDelegate = self;
        //显示控制器
        [self presentViewController:vc animated:YES completion:nil];
    };

    
    // 1.3.邮件分享
    SJSettingArrowItem *mail = [[SJSettingArrowItem alloc] initWithIcon:@"MailShare" title:@"邮件分享"];
    mail.option = ^{
        //当邮件发送成功或者失败或者取消，不会回到应用
//        NSURL *url = [NSURL URLWithString:@"mailto://10010@qq.com"];
//        [[UIApplication sharedApplication] openURL:url];
        // 不能发邮件
        if (![MFMailComposeViewController canSendMail]) return;
        
        MFMailComposeViewController *vc = [[MFMailComposeViewController alloc] init];
        
        // 设置邮件主题
        [vc setSubject:@"会议"];
        // 设置邮件内容
        [vc setMessageBody:@"今天下午开会吧" isHTML:NO];
        // 设置收件人列表
        [vc setToRecipients:@[@"643055866@qq.com"]];
        // 设置抄送人列表
        [vc setCcRecipients:@[@"1234@qq.com"]];
        // 设置密送人列表
        [vc setBccRecipients:@[@"56789@qq.com"]];
        
        // 添加附件（一张图片）
        UIImage *image = [UIImage imageNamed:@"lufy.jpeg"];
        NSData *data = UIImageJPEGRepresentation(image, 0.5);
        [vc addAttachmentData:data mimeType:@"image/jepg" fileName:@"lufy.jpeg"];
        
        // 设置代理
        vc.mailComposeDelegate = self;
        // 显示控制器
        [self presentViewController:vc animated:YES completion:nil];

    };
    
    NJProductGroup *group = [[NJProductGroup alloc] init];
    group.items = @[weibo,sms,mail];
    [self.datas addObject:group];

}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    NSLog(@"MFMessageComposeViewController");
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    if(MessageComposeResultCancelled == result){
        NSLog(@"取消发送");
    }else if(MessageComposeResultSent == result){
        NSLog(@"发送成功");
    }else if(MessageComposeResultFailed == result){
        NSLog(@"发送失败");
    }
}


-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    NSLog(@"didFinishWithResult");
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    if(MessageComposeResultCancelled == result){
        NSLog(@"取消发送");
    }else if(MessageComposeResultSent == result){
        NSLog(@"发送成功");
    }else if(MessageComposeResultFailed == result){
        NSLog(@"发送失败");
    }

}


@end
