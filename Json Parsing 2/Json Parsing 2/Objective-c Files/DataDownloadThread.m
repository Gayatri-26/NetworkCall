//
//  DataDownloadThread.m
//  Json Parsing 2
//
//  Created by Mac on 21/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "DataDownloadThread.h"

@implementation DataDownloadThread

+(void) withblock:(void (^)(NSData *, NSError *))block{
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/ws_dog_info.php"]];
    
    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          if(data != nil)
                                          {
                                              NSLog(@"Response : %@",data);
                                              block(data,error);
                                          }
                                          else
                                          {
                                              NSLog(@"Error");
                                              block(nil,error);
                                          }
                                      }];
    
    [dataTask resume];
}
@end
