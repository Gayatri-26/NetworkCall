//
//  JSONDownloadOperation.m
//  Json Parsing 2
//
//  Created by Mac on 21/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "JSONDownloadOperation.h"

@implementation JSONDownloadOperation

-(void) main{
    [super main];
    NSData *data = [NSData dataWithContentsOfURL:self.url];
    self.DataCallback(data, nil);
}

- (id)initWithURL: (NSURL *)url andCallBack: (void (^)( NSData *data, NSError *error))completionHandler{
    self = [super init];
    self.url = url;
    self.DataCallback = completionHandler;
    return self;
}

//NSError* error = nil;
//NSData* data = [NSData dataWithContentsOfURL:yourURL options:NSDataReadingUncached error:&error];
//if (error) {
//    NSLog(@"%@", [error localizedDescription]);
//    [error release];
//} else {
//    NSLog(@"Data has loaded successfully.");
//}

//+(void) withblock:(void (^)(NSData *, NSError *))block{
//
//   NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/ws_dog_info.php"]];
//
//    [urlRequest setHTTPMethod:@"GET"];
//
//    NSURLSession *session = [NSURLSession sharedSession];
//
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
//                                      {
//                                          if(data != nil)
//                                          {
//                                              NSLog(@"Response : %@",data);
//                                              block(data,error);
//                                          }
//                                          else
//                                          {
//                                              NSLog(@"Error");
//                                              block(nil,error);
//                                          }
//                                      }];
//
//    [dataTask resume];
//}
@end
