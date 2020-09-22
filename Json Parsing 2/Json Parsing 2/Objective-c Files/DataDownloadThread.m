//
//  DataDownloadThread.m
//  Json Parsing 2
//
//  Created by Mac on 21/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "DataDownloadThread.h"

@implementation DataDownloadThread

-(void)main{
    [super main];
    NSData *data = [NSData dataWithContentsOfURL:self.url1];
    self.DataCallback(data, nil);
    
}

- (id)initWithURL: (NSURL *)url1 andCallBack: (void (^)( NSData *data, NSError *error))completionHandler{

    self = [super init];
    self.url1 = url1;
    self.DataCallback = completionHandler;
    
    return self;

}

@end
