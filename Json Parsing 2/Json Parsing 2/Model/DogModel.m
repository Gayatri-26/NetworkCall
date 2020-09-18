//
//  DogModel.m
//  Json Parsing 2
//
//  Created by Mac on 17/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "DogModel.h"
#import "OperationViewController.h"

@implementation DogModel

+(NSMutableArray < DogModel *> *)modelArrayFromDict:(NSDictionary *) d
{
    NSMutableArray *dogarr = [[NSMutableArray alloc]init];
    
    if (d != nil){
        
        for(NSDictionary *dict in d){
            
            DogModel *dogDetails = [[DogModel alloc]init];
            NSString *strbreed = [dict objectForKey:@"breed"];
            dogDetails.Breed = strbreed;
            
            NSString *strhighclass = [dict objectForKey:@"Higher classification"];
            dogDetails.HigherClass = strhighclass;
            
            NSString *strlifespan = [dict objectForKey:@"Life span"];
            dogDetails.LifeSpan = strlifespan;
            
            NSString *strcolor = [dict objectForKey:@"Colors"];
            dogDetails.Colors = strcolor;
            
            // NSString *strimg = [dict objectForKey:@"image"];
            // EmpDetails.img = strimg;
        }
            [dogarr addObject:dogDetails];
        }
  
    }
@end
