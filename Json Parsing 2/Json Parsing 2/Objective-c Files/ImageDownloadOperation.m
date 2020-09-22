//
//  ImageDownloadOperation.m
//  Json Parsing 2
//
//  Created by Mac on 21/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "ImageDownloadOperation.h"
#import <UIKit/UIKit.h>
#import "DogDetailVC.h"
#import "DogModel.h"


@implementation ImageDownloadOperation

-(void) main{
    [super main];
  //  NSURL *strimg = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/images/bulldog.jpg"];
   //  NSData *data = [NSData dataWithContentsOfURL:self.url];
   // UIImage *ImageDownload = [UIImage imageWithData:[NSData dataWithContentsOfURL:dogpath]];

    self.ImageCallBack(_url, nil);
}

- (id)initWithURL: (NSURL *)url andCallBack1: (void (^)( NSURL *url, NSError *error))completionHandler{
    self = [super init];
    self.url = url;
    self.ImageCallBack = completionHandler;
    return self;
}












//+(void) withblock:(void (^)(NSURL *, NSError *))block{
//
//    NSURL *url = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/bulldog.jpg"];
//
//    NSURLSessionDownloadTask *downloadImageTask = [[NSURLSession sharedSession]
//    downloadTaskWithURL:url completionHandler:^(NSURL *path, NSURLResponse *response, NSError *error) {
//        if(path != nil){
//            NSLog(@"ImageResponse: %@",path);
//            block(path,error);
//        }
//        else{
//            NSLog(@"Error: %@",error);
//            block(nil,error);
//        }
//
//        }];
//    [downloadImageTask resume];
//
//}
@end

