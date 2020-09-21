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
    
    NSURL *url1 = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/images/bulldog.jpg"];
    
    NSURLSessionDownloadTask *firstDownloadTask = [[NSURLSession sharedSession]
                                                   downloadTaskWithURL:url1 completionHandler:^(NSURL *path, NSURLResponse *response, NSError *error) {
                                                       if(path != nil){
                                                           NSLog(@"ImageResponse: %@",path);
                                                           block(path,error);
                                                       }
                                                       else{
                                                           NSLog(@"Error: %@",error);
                                                           block(nil,error);
                                                       }
                                                       
                                                   }];
    [firstDownloadTask resume];
    
//    NSURL *url2 = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/images/labrador.jpg"];
//
//    NSURLSessionDownloadTask *secondDownloadTask = [[NSURLSession sharedSession]
//                                                    downloadTaskWithURL:url2 completionHandler:^(NSURL *path, NSURLResponse *response, NSError *error) {
//                                                        if(path != nil){
//                                                            NSLog(@"ImageResponse: %@",path);
//                                                            block(path,error);
//                                                        }
//                                                        else{
//                                                            NSLog(@"Error: %@",error);
//                                                            block(nil,error);
//                                                        }
//                                                    }];
//    [secondDownloadTask resume];
//
//    NSURL *url3 = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/images/shefard.jpg"];
//
//    NSURLSessionDownloadTask *thirdDownloadTask = [[NSURLSession sharedSession]
//                                                   downloadTaskWithURL:url3 completionHandler:^(NSURL *path, NSURLResponse *response, NSError *error) {
//                                                       if(path != nil){
//                                                           NSLog(@"ImageResponse: %@",path);
//                                                           block(path,error);
//                                                       }
//                                                       else{
//                                                           NSLog(@"Error: %@",error);
//                                                           block(nil,error);
//                                                       }
//                                                   }];
//    [thirdDownloadTask resume];
//
//    NSURL *url4 = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/images/golden_retriever.jpg"];
//
//    NSURLSessionDownloadTask *fourthDownloadTask = [[NSURLSession sharedSession]
//                                                    downloadTaskWithURL:url4 completionHandler:^(NSURL *path, NSURLResponse *response, NSError *error) {
//                                                        if(path != nil){
//                                                            NSLog(@"ImageResponse: %@",path);
//                                                            block(path,error);
//                                                        }
//                                                        else{
//                                                            NSLog(@"Error: %@",error);
//                                                            block(nil,error);
//                                                        }
//                                                    }];
//    [fourthDownloadTask resume];
//
//    NSURL *url5 = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/images/pug.jpg"];
//
//    NSURLSessionDownloadTask *fifthDownloadTask = [[NSURLSession sharedSession]
//                                                   downloadTaskWithURL:url5 completionHandler:^(NSURL *path, NSURLResponse *response, NSError *error) {
//                                                       if(path != nil){
//                                                           NSLog(@"ImageResponse: %@",path);
//                                                           block(path,error);
//                                                       }
//                                                       else{
//                                                           NSLog(@"Error: %@",error);
//                                                           block(nil,error);
//                                                       }
//                                                   }];
//    [fifthDownloadTask resume];
//
//
//    NSURL *url6 = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/images/husky.jpg"];
//
//    NSURLSessionDownloadTask *sixthDownloadTask = [[NSURLSession sharedSession]
//                                                   downloadTaskWithURL:url6 completionHandler:^(NSURL *path, NSURLResponse *response, NSError *error) {
//                                                       if(path != nil){
//                                                           NSLog(@"ImageResponse: %@",path);
//                                                           block(path,error);
//                                                       }
//                                                       else{
//                                                           NSLog(@"Error: %@",error);
//                                                           block(nil,error);
//                                                       }
//                                                   }];
//    [sixthDownloadTask resume];
//
//    NSURL *url7 = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/images/rottweiler.jpg"];
//
//    NSURLSessionDownloadTask *seventhDownloadTask = [[NSURLSession sharedSession]
//                                                     downloadTaskWithURL:url7 completionHandler:^(NSURL *path, NSURLResponse *response, NSError *error) {
//                                                         if(path != nil){
//                                                             NSLog(@"ImageResponse: %@",path);
//                                                             block(path,error);
//                                                         }
//                                                         else{
//                                                             NSLog(@"Error: %@",error);
//                                                             block(nil,error);
//                                                         }
//                                                     }];
//    [seventhDownloadTask resume];
//
//    NSURL *url8 = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/images/doberman.jpg"];
//
//    NSURLSessionDownloadTask *eigthDownloadTask = [[NSURLSession sharedSession]
//                                                   downloadTaskWithURL:url8 completionHandler:^(NSURL *path, NSURLResponse *response, NSError *error) {
//                                                       if(path != nil){
//                                                           NSLog(@"ImageResponse: %@",path);
//                                                           block(path,error);
//                                                       }
//                                                       else{
//                                                           NSLog(@"Error: %@",error);
//                                                           block(nil,error);
//                                                       }
//                                                   }];
//    [eigthDownloadTask resume];
//
}
@end
