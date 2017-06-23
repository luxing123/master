//
//  NotificationService.m
//  NotificationExtension
//
//  Created by 111 on 2017/6/22.
//  Copyright © 2017年 luxing. All rights reserved.
//

#import "NotificationService.h"
#import "DownloadImageTool.h"
@interface NotificationService ()

@property (nonatomic, strong) void (^contentHandler)(UNNotificationContent *contentToDeliver);
@property (nonatomic, strong) UNMutableNotificationContent *bestAttemptContent;

@end

@implementation NotificationService

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler {
    
//    if([request.trigger isKindOfClass:[UNPushNotificationTrigger class]])
//    {
//        NSLog(@"iOS10 前台收到远程通知");
//        return;
//    }
    
    self.contentHandler = contentHandler;
    // copy发来的通知，开始做一些处理
    self.bestAttemptContent = [request.content mutableCopy];
    
    // Modify the notification content here...
    self.bestAttemptContent.title = [NSString stringWithFormat:@"%@ [modified]", self.bestAttemptContent.title];
    self.bestAttemptContent.title = @"标题";
    self.bestAttemptContent.subtitle = @"子标题";
    self.bestAttemptContent.body = @"body";
    self.bestAttemptContent.sound = [UNNotificationSound soundNamed:@"default"];
    
    // 附件
//    NSDictionary *dict =  self.bestAttemptContent.userInfo;
//    NSDictionary *notiDict = dict[@"aps"];
//    NSString *imgUrl = [NSString stringWithFormat:@"%@",notiDict[@"imageAbsoluteString"]];
//    
//    if (!imgUrl.length) {
//        self.contentHandler(self.bestAttemptContent);
//    }
    
    UNNotificationAttachment * attachment = [UNNotificationAttachment attachmentWithIdentifier:@"photo" URL:[DownloadImageTool downLoadImageWriteToFile] options:nil error:nil];
    if (attachment)
    {
        self.bestAttemptContent.attachments = @[attachment];
    }
    self.contentHandler(self.bestAttemptContent);
}

- (void)serviceExtensionTimeWillExpire {
    // Called just before the extension will be terminated by the system.
    // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
    self.contentHandler(self.bestAttemptContent);
}

@end
