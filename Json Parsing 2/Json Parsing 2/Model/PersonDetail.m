//
//  PersonDetail.m
//  Json Parsing 2
//
//  Created by Mac on 04/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "PersonDetail.h"
#import "SecondVC.h"

@implementation PersonDetail

@synthesize Pid, Pname, Pemail, Paddress, Pgender;
+(NSMutableArray < PersonDetail *> *)modelArrayFromDict:(NSDictionary *) d {

   for (NSDictionary *dict in _PersonData)
   {
       PersonDetail *PersonDet = [[PersonDetail alloc]init];
       
       NSString *strid = [dict valueForKey:@"id"];
       PersonDet.Pid = strid;
       
       NSString *strname = [dict valueForKey:@"name"];
       PersonDet.Pname = strname;
       
       NSString *stremail = [dict valueForKey:@"email"];
       PersonDet.Pemail= stremail;
       
       NSString *straddress = [dict valueForKey:@"address"];
       PersonDet.Paddress = straddress;
       
       NSString *strgender = [dict valueForKey:@"gender"];
       PersonDet.Pgender = strgender;
       
   }
        }
    } return emparr;
}
@end
