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

+(void)executequery:(NSString *)strurl strpremeter:(NSString *)premeter withblock:(void (^)(NSData *, NSError *))block
{
    //Step:-1 Session Create
    NSURLSessionConfiguration *defaultconfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];//New Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultconfiguration delegate:nil delegateQueue:[NSOperationQueue mainQueue]];//Queue is Stroing and retrieve data FIFO
    
    NSURL *urlrequest = [NSURL URLWithString:strurl];
    NSMutableURLRequest*mutablerequest = [NSMutableURLRequest requestWithURL:urlrequest];
    
//    NSString * parm = premeter;//Method and Body
    [mutablerequest setHTTPMethod:@"GET"];//Adding Data is Url With Json
    //    [mutablerequest setHTTPBody:[parm dataUsingEncoding:NSUTF8StringEncoding]];//Data Encoding UTF-8
    NSURLSessionDataTask * task = [session dataTaskWithRequest:mutablerequest completionHandler:^(NSData *  data, NSURLResponse * response, NSError *  error) {
        if (data!=nil)
        {
            NSLog(@"Response %@", data);
            block(data,error);//Data is NSDATA and Error is NSERROR
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
