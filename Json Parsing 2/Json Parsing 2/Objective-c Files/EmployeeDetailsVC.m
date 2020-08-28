//
//  EmployeeDetailsVC.m
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "EmployeeDetailsVC.h"

@interface EmployeeDetailsVC ()

@end

@implementation EmployeeDetailsVC
//returnType ^ (parameters) <blockname>
//(void (^)(NSData *, NSError *))block
+(void)executequery:(NSString *)strurl strpremeter:(NSString *)premeter withblock:(void (^)(NSData *, NSError *))block
{
    NSURLSessionConfiguration *defaultconfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultconfiguration delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURL *urlrequest = [NSURL URLWithString:strurl];
    
    NSMutableURLRequest*mutablerequest = [NSMutableURLRequest requestWithURL:urlrequest];
    
    [mutablerequest setHTTPMethod:@"GET"];
   
    NSURLSessionDataTask * task = [session dataTaskWithRequest:mutablerequest completionHandler:^(NSData *  data, NSURLResponse * response, NSError *  error) {
        if (data!=nil)
        {
            NSLog(@"Response %@", data);
            block(data,error);
        }
        else
        {
            NSLog(@"error");
            block(nil,error);
        }
    }];
    [task resume];
}

@end
