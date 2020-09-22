//
//  DataDownloadThread.h
//  Json Parsing 2
//
//  Created by Mac on 21/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataDownloadThread : NSThread

//+(void) withblock:(void (^)(NSData *, NSError *))block;

@property(nonatomic, strong) NSURL *url1;
@property (nonatomic, strong) void (^DataCallback)(NSData *data, NSError *error);
- (id)initWithURL: (NSURL *)url1 andCallBack: (void (^)( NSData *data, NSError *error))completionHandler;


@end
