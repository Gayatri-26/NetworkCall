//
//  JSONDownloadOperation.h
//  Json Parsing 2
//
//  Created by Mac on 21/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JSONDownloadOperation : NSOperation

+(void) withblock:(void (^)(NSData *, NSError *))block;

@property(nonatomic, strong) NSURL *url;
@property (nonatomic, copy) void (^JsonCallback)(NSData *data, NSError *error);
@end

