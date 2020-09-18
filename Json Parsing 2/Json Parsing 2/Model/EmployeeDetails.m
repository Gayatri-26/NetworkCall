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

//@synthesize EmpId, Name, Salary, Age;

+(NSMutableArray < EmployeeDetails *> *)modelArrayFromDict:(NSDictionary *) d {

   NSMutableArray *emparr = [[NSMutableArray alloc]init];

    if (d != nil){
//        NSDictionary *dict1 = [d objectForKey:@"data"];
//        for(NSDictionary *dict in dict1){
//            EmployeeDetails *EmpDetails = [[EmployeeDetails alloc]init];
//            NSString *strid = [dict objectForKey:@"id"];
//            EmpDetails.EmpId = strid;
//            NSString *strname = [dict objectForKey:@"employee_name"];
//            EmpDetails.Name = strname;
//            NSString *strsalary = [dict objectForKey:@"employee_salary"];
//            EmpDetails.Salary = strsalary;
//            NSString *strage = [dict objectForKey:@"employee_age"];
//            EmpDetails.Age = strage;
//
////            NSLog(@"employee: %@ %@", strid,strage);
//
//            [emparr addObject:EmpDetails];
//        }
        for(NSDictionary *dict in d){
            
            EmployeeDetails *EmpDetails = [[EmployeeDetails alloc]init];
            NSString *strbreed = [dict objectForKey:@"breed"];
            EmpDetails.Breed = strbreed;
            
            NSString *strhighclass = [dict objectForKey:@"Higher classification"];
            EmpDetails.HigherClass = strhighclass;
            
            NSString *strlifespan = [dict objectForKey:@"Life span"];
            EmpDetails.LifeSpan = strlifespan;
            
            NSString *strcolor = [dict objectForKey:@"Colors"];
            EmpDetails.Colors = strcolor;
            
//            NSString *strimg = [dict objectForKey:@"image"];
//            EmpDetails.img = strimg;
            
            [emparr addObject:EmpDetails];
        }
    }
    return emparr;
}
@end


