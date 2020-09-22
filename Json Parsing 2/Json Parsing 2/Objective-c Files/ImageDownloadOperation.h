//
//  ImageDownloadOperation.h
//  Json Parsing 2
//
//  Created by Mac on 21/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageDownloadOperation : NSOperation

-(id)initWithURL: (NSURL *)url andCallBack1: (void (^)( NSURL *url, NSError *error))completionHandler;

@property(nonatomic, strong) NSURL *url;

@property (nonatomic, copy) void (^ImageCallBack)(NSURL *url, NSError *error);
@end


