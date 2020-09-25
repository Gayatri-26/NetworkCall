//
//  Person.m
//  Json Parsing 2
//
//  Created by Mac on 24/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize Pid, Pname, Pemail, Paddress, Pgender;

+(NSMutableArray < Person * > *)modelArrayFromDict1:(NSDictionary *) d1{

NSMutableArray *Personarr = [[NSMutableArray alloc]init];
NSDictionary *dic1 = [d1 objectForKey:@"contacts"];

for (NSDictionary *dict in dic1)
 {
    Person *PersonDet = [[Person alloc]init];
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
    [Personarr addObject:PersonDet];

  }
    return Personarr;
}

@end
