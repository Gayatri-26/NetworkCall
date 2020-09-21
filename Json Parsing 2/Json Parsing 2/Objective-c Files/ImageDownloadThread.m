//
//  ImageDownloadThread.m
//  Json Parsing 2
//
//  Created by Mac on 21/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "ImageDownloadThread.h"

@implementation ImageDownloadThread

+(void) withblock:(void (^)(NSURL *, NSError *))block{
    
    NSURL *url = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/images/bulldog.jpg"];
    
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
