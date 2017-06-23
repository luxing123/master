//
//  DownloadImageTool.m
//  NotificationDemo
//
//  Created by 111 on 2017/6/23.
//  Copyright © 2017年 luxing. All rights reserved.
//

#import "DownloadImageTool.h"

@implementation DownloadImageTool

+ (NSURL *)downLoadImageWriteToFile
{
    NSString * imageUrlString = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1498126852931&di=ea319e85265ebba2beb1d6dd2e96e141&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Ff7246b600c338744bb27ea5e5b0fd9f9d72aa036.jpg";
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrlString]];
    
    //3.2图片保存到沙盒
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *localPath = [documentPath stringByAppendingPathComponent:@"localNotificationImage.jpg"];
    [imageData writeToFile:localPath atomically:YES];
    NSURL *url = [NSURL URLWithString:[@"file://" stringByAppendingString:localPath]];
    return url;
}

@end
