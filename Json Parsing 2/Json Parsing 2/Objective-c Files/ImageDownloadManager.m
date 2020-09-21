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


+(void)executequery:(NSString *)strurl strparameter:(NSString *)parameter withblock:(void (^)(NSData *, NSError *))block{

//-(void)DownloadImage1{

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


//+(void)executequery:(NSString *)strurl strpremeter:(NSString *)premeter withblock:(void (^)(NSData *, NSError *))block
//{
//    NSURLSessionConfiguration *defaultconfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
//
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultconfiguration delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
//
//    NSURL *urlrequest = [NSURL URLWithString:strurl];
//
//    NSMutableURLRequest*mutablerequest = [NSMutableURLRequest requestWithURL:urlrequest];
//
//    [mutablerequest setHTTPMethod:@"GET"];
//
//    NSURLSessionDataTask * task = [session dataTaskWithRequest:mutablerequest completionHandler:^(NSData *  data, NSURLResponse * response, NSError *  error) {
//        if (data!=nil)
//        {
//            NSLog(@"Response %@", data);
//            block(data,error);
//        }
//        else
//        {
//            NSLog(@"error");
//            block(nil,error);
//        }
//    }];
//    [task resume];
//}
//


@end
