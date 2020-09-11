//
//  PersonDetail.m
//  Json Parsing 2
//
//  Created by Mac on 04/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "PersonDetail.h"
#import "SecondVC.h"

#import "PersonDetail.h"

@implementation PersonDetail

@synthesize Pid, Pname, Pemail, Paddress, Pgender;


+(NSMutableArray < PersonDetail * > *)modelArrayFromDict:(NSDictionary *) d{
    
NSMutableArray *personDetailArr = [[NSMutableArray alloc]init];
NSDictionary *dic1 = [d objectForKey:@"contacts"];
   
for (NSDictionary *dict in dic1)
{
    PersonDetail *PersonDet = [[PersonDetail alloc]init];
    NSString *strid = [dict objectForKey:@"id"];
    PersonDet.Pid = strid;
    
    NSString *strname = [dict objectForKey:@"name"];
    PersonDet.Pname = strname;
    
    NSString *stremail = [dict objectForKey:@"email"];
    PersonDet.Pemail= stremail;
    
    NSString *straddress = [dict objectForKey:@"address"];
    PersonDet.Paddress = straddress;
    
    NSString *strgender = [dict objectForKey:@"gender"];
    PersonDet.Pgender = strgender;
    [personDetailArr addObject:PersonDet];
   
 }
    return personDetailArr;
}
@end
