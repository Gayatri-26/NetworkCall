//
//  ImageDownloadManager.m
//  Json Parsing 2
//
//  Created by Mac on 20/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "ImageDownloadManager.h"
#import "DogModel.h"
#import "DogDetailVC.h"

@implementation ImageDownloadManager



-(void)DownloadImage1{

    NSURL *url = [NSURL URLWithString:
  @"http://bitcodetech.in/ws_ios_assignment/images/bulldog.jpg"];

NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession]
 downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
  UIImage *downloadedImage = [UIImage imageWithData:
    [NSData dataWithContentsOfURL:location]];
    
    DogModel *dog = [_temparr firstObject];
    dog.img = downloadedImage;
   
}];
    
    [downloadPhotoTask resume];
}

@end
