//
//  NotificationViewController.m
//  ContentExtention
//
//  Created by 111 on 2017/6/22.
//  Copyright © 2017年 luxing. All rights reserved.
//

#import "NotificationViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

@interface NotificationViewController () <UNNotificationContentExtension>

@property IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any required interface initialization here.
    self.preferredContentSize = CGSizeMake(self.view.frame.size.width, 100);
}

- (void)didReceiveNotification:(UNNotification *)notification {
    self.label.text = notification.request.content.body;
    NSString * imageUrlString = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1498126852931&di=ea319e85265ebba2beb1d6dd2e96e141&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Ff7246b600c338744bb27ea5e5b0fd9f9d72aa036.jpg";
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrlString]];

    self.myImageView.image = [UIImage imageWithData:imageData];
}

@end
