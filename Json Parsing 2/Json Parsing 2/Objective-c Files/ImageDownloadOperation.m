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


+(void) withblock:(void (^)(NSURL *, NSError *))block{
    
    NSURL *url = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/bulldog.jpg"];

    NSURLSessionDownloadTask *downloadImageTask = [[NSURLSession sharedSession]
    downloadTaskWithURL:url completionHandler:^(NSURL *path, NSURLResponse *response, NSError *error) {
        if(path != nil){
            NSLog(@"ImageResponse: %@",path);
            block(path,error);
        }
        else{
            NSLog(@"Error: %@",error);
            block(nil,error);
        }
                                                       
        }];
    [downloadImageTask resume];
    
}
@end

//  NSURL *url1 = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/labrador.jpg"];

 // NSURL *url2 = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/shefard.jpg"];

 // NSURL *url3 = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/golden_retriever.jpg"];

 // NSURL *url4 = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/pug.jpg"];

//  NSURL *url5 = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/husky.jpg"];

 // NSURL *url6 = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/rottweiler.jpg"];

 // NSURL *url7 = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/doberman.jpg"];

//
//   NSBlockOperation* theOp = [NSBlockOperation blockOperationWithBlock: ^{
//       NSLog(@"Beginning operation.\n");
//    }];
