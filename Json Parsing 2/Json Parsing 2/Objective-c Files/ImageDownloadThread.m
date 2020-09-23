//
//  ImageDownloadThread.m
//  Json Parsing 2
//
//  Created by Mac on 21/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "ImageDownloadThread.h"

@implementation ImageDownloadThread

-(void)main{
    [super main];
    NSString *dgbreed = [NSString stringWithString:self.breed];
    UIImage *imgdata = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.url2]];
    self.ImageCallback(dgbreed, imgdata, nil);
}

- (id)initWithbreed:(NSString *)breed andWithURL: (NSURL *)url1 andCallBack: (void (^)(NSString *breed, UIImage *img, NSError *error))completionHandler{
    
    self = [super init];
    self.breed = breed;
    self.url2 = url1;
    self.ImageCallback = completionHandler;

    return self;
}

@end
