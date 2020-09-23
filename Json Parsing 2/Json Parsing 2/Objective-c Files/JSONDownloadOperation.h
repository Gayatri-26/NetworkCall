//
//  JSONDownloadOperation.h
//  Json Parsing 2
//
//  Created by Mac on 21/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JSONDownloadOperation : NSOperation


- (id)initWithURL: (NSURL *)url andCallBack: (void (^)( NSData *data, NSError *error))completionHandler;

@property(nonatomic, strong) NSURL *url;

@property (nonatomic, copy) void (^DataCallback)(NSData *data, NSError *error);



@end

