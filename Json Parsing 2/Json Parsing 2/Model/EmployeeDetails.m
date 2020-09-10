//
//  EmployeeDetails.m
//  Json Parsing 2
//
//  Created by Mac on 28/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "EmployeeDetails.h"
#import "FirstVC.h"

@implementation EmployeeDetails

@synthesize EmpId, Name, Salary, Age;

+(NSMutableArray < EmployeeDetails *> *)modelArrayFromDict:(NSDictionary *) d {

   NSMutableArray *emparr = [[NSMutableArray alloc]init];

    if (d != nil){
        NSDictionary *dict1 = [d objectForKey:@"data"];
        for(NSDictionary *dict in dict1){
            EmployeeDetails *EmpDetails = [[EmployeeDetails alloc]init];
            NSString *strid = [dict objectForKey:@"id"];
            EmpDetails.EmpId = strid;
            NSString *strname = [dict objectForKey:@"employee_name"];
            EmpDetails.Name = strname;
            NSString *strsalary = [dict objectForKey:@"employee_salary"];
            EmpDetails.Salary = strsalary;
            NSString *strage = [dict objectForKey:@"employee_age"];
            EmpDetails.Age = strage;
            
//            NSLog(@"employee: %@ %@", strid,strage);

            [emparr addObject:EmpDetails];
        }
    }
    return emparr;
}
@end


