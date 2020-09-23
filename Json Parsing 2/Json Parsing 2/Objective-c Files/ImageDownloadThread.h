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

@property(nonatomic, strong) NSURL *url1;
@property (nonatomic, strong) void (^ImageCallback)(NSString *breed, UIImage *img, NSError *error);
@property (nonatomic,strong) NSString *breed;

- (id)initWithbreed:(NSString *)breed andWithURL: (NSURL *)url1 andCallBack: (void (^)(NSString *breed, UIImage *img, NSError *error))completionHandler;

@end
