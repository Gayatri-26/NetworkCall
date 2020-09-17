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

@synthesize Dbreed, Dtemperament, Dimage,Dcolors, Dheight, Dweight;


+(NSMutableArray <DogModel * > *)modelArrayFromDict:(NSDictionary *) d1{
    
NSMutableArray *dogModelarr = [[NSMutableArray alloc]init];
NSDictionary *dic1 = [d1 objectForKey:@"contacts"];
   
for (NSDictionary *dict in dic1)
{
    DogModel *Dog = [[DogModel alloc]init];
    NSString *strbreed = [dict objectForKey:@"breed"];
    Dog.Dbreed = strbreed;
    
    NSString *strtemperament = [dict objectForKey:@"Temperament"];
    Dog.Dtemperament = strtemperament;
    
    UIImage *strimage = [dict objectForKey:@"image"];
    Dog.Dimage= strimage;
    
    NSString *strcolor = [dict objectForKey:@"Colors"];
       Dog.Dcolors = strcolor;
    
    NSString *strheight = [dict objectForKey:@"Height"];
       Dog.Dheight = strheight;
    
    NSString *strweight = [dict objectForKey:@"Weight"];
       Dog.Dweight = strweight;
    
    
    
    
    [dogModelarr addObject:Dog];
   
 }
    return dogModelarr;
}


@end
