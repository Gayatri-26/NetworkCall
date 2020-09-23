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


@end
