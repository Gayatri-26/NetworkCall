//
//  ImageDownloadThread.h
//  Json Parsing 2
//
//  Created by Mac on 21/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageDownloadThread : NSThread

+(void) withblock:(void (^)(NSURL *, NSError *))block;

@end
