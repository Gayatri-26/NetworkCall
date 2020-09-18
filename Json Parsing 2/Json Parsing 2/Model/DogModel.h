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

@property (strong,nonatomic) NSString *Breed;
@property (strong,nonatomic) NSString *HigherClass;
@property (strong,nonatomic) NSString *LifeSpan;
@property (strong,nonatomic) NSString *Colors;

+(NSMutableArray < DogModel * > *)modelArrayFromDict:(NSDictionary *) d;

@end

