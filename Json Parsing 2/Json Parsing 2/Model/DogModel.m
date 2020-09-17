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

@synthesize Dbreed, DTemperament, DImage;


+(NSMutableArray < DogModel * > *)modelArrayFromDict:(NSDictionary *) d1{
    
NSMutableArray *dogModelarr = [[NSMutableArray alloc]init];
NSDictionary *dic1 = [d1 objectForKey:@""];
   
for (NSDictionary *dict in dic1)
{
    DogModel *Dog = [[DogModel alloc]init];
    NSString *strbreed = [dict objectForKey:@"breed"];
    Dog.Dbreed = strbreed;
    
    NSString *strtemperament = [dict objectForKey:@"Temperament"];
    Dog.DTemperament = strtemperament;
    
    NSString *strimage = [dict objectForKey:@"image"];
    Dog.DImage= strimage;
    
    [dogModelarr addObject:Dog];
   
 }
    return dogModelarr;
}


@end
