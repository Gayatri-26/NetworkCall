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
@property (nonatomic,strong) NSString *DTemperament;
@property (nonatomic,strong) UIImage *DImage;
+(NSMutableArray < DogModel * > *)modelArrayFromDict:(NSDictionary *) d1;

@end

