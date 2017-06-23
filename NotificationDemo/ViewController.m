//
//  ViewController.m
//  NotificationDemo
//
//  Created by 111 on 2017/6/22.
//  Copyright © 2017年 luxing. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <CoreLocation/CoreLocation.h>
#import "DownloadImageTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.本地通知
    [self locationNotification];

}
- (void)locationNotification{
    
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"本地通知标题";
    content.subtitle = @"本地通知子标题";
    content.body = @"本地通知";
    content.badge = @1;
    content.sound = [UNNotificationSound defaultSound];
    UNNotificationAttachment * attachment = [UNNotificationAttachment attachmentWithIdentifier:@"photo" URL:[DownloadImageTool downLoadImageWriteToFile] options:nil error:nil];
    if (attachment)
    {
        content.attachments = @[attachment];
    }
     /*触发模式1 */
    UNTimeIntervalNotificationTrigger *trigger1 = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
    /*触发模式2*/
    // 周一早上 8：00 上班
    NSDateComponents *components = [[NSDateComponents alloc] init];
    // 注意，weekday是从周日开始的，如果想设置为从周一开始，大家可以自己想想~
    components.weekday = 2;
    components.hour = 8;
    UNCalendarNotificationTrigger *trigger2 = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:YES];
    
    // 创建本地通知
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"iden" content:content trigger:trigger1];
    
    //把通知加到UNUserNotificationCenter, 到指定触发点会被触发
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"本地通知已触发");
        
    }];
}

@end
