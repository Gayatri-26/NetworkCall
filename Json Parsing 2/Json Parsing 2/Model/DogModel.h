//
//  DogModel.h
//  Json Parsing 2
//
//  Created by Mac on 17/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface DogModel : NSObject

@property (nonatomic,strong) NSString *Dbreed;
@property (nonatomic,strong) NSString *Dtemperament;
@property (nonatomic,strong) UIImage  *Dimage;
@property (nonatomic,strong) NSString *Dcolors;
@property (nonatomic,strong) NSString *Dheight;
@property (nonatomic,strong) NSString *Dweight;

+(NSMutableArray < DogModel * > *)modelArrayFromDict:(NSDictionary *) d1;

@end

