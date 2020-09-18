//
//  DogBreedsDetails.m
//  Json Parsing 2
//
//  Created by Mac on 07/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "DogBreedsDetails.h"

@implementation DogBreedsDetails
+(NSMutableArray < DogBreedsDetails *> *)modelArrayFromDict:(NSDictionary *) d
{
    NSMutableArray *dogarr = [[NSMutableArray alloc]init];
    
    if (d != nil){
        
        for(NSDictionary *dict in d){
            
            DogBreedsDetails *dogDetails = [[DogBreedsDetails alloc]init];
            NSString *strbreed = [dict objectForKey:@"breed"];
            dogDetails.Breed = strbreed;
            
            NSString *strhighclass = [dict objectForKey:@"Higher classification"];
            dogDetails.HigherClass = strhighclass;
            
            NSString *strlifespan = [dict objectForKey:@"Life span"];
            dogDetails.LifeSpan = strlifespan;
            
            NSString *strcolor = [dict objectForKey:@"Colors"];
            dogDetails.Colors = strcolor;
            
//            NSString *strimg = [dict objectForKey:@"image"];
//            dogDetails.img = strimg;
            
            [dogarr addObject:dogDetails];
        }
    }
    return dogarr;
}

@end
