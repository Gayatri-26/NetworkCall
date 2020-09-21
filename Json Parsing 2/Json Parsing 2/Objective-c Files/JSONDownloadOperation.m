//
//  JSONDownloadOperation.m
//  Json Parsing 2
//
//  Created by Mac on 21/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "JSONDownloadOperation.h"

@implementation JSONDownloadOperation

- (id)initWithURL: (NSURL *)url1 andCallBack: (void (^)( NSData *data, NSError *error))completionHandler{
    self = [super init];
    self.url = url1;
    self.JsonCallback = completionHandler;
    return self;
}


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
