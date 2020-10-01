//
//  PersonDetail.m
//  Json Parsing 2
//
//  Created by Mac on 24/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "PersonDetail.h"

@implementation PersonDetail

@synthesize pid, name, email, address, gender;


+(NSMutableArray < PersonDetail * > *)modelArrayFromDict:(NSDictionary *) d{
    
NSMutableArray *personDetailArr = [[NSMutableArray alloc]init];
NSDictionary *dic1 = [d objectForKey:@"contacts"];
   
for (NSDictionary *dict in dic1)
 {
    PersonDetail *PersonDet = [[PersonDetail alloc]init];
     
    NSString *strid = [dict objectForKey:@"id"];
    PersonDet.pid = strid;
    
    NSString *strname = [dict objectForKey:@"name"];
    PersonDet.name = strname;
    
    NSString *stremail = [dict objectForKey:@"email"];
    PersonDet.email= stremail;
    
    NSString *straddress = [dict objectForKey:@"address"];
    PersonDet.address = straddress;
    
    NSString *strgender = [dict objectForKey:@"gender"];
    PersonDet.gender = strgender;
    [personDetailArr addObject:PersonDet];
   
  }
    return personDetailArr;
}

@end
