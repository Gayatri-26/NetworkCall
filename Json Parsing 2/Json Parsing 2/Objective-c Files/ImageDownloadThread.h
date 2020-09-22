//
//  ImageDownloadThread.h
//  Json Parsing 2
//
//  Created by Mac on 21/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageDownloadThread : NSThread

//+(void) withblock:(void (^)(NSURL *, NSError *))block;

@property(nonatomic, strong) NSURL *url2;
@property (nonatomic, strong) void (^ImageCallback)(UIImage *img, NSError *error);
@property (nonatomic,strong) NSString *breed;

- (id)initWithbreed:(NSString *)breed andWithURL1: (NSURL *)url1 andCallBack1: (void (^)(NSData *breed, UIImage *img, NSError *error))completionHandler;
@end
