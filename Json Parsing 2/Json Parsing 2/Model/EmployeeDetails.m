//
//  EmployeeDetails.m
//  Json Parsing 2
//
//  Created by Mac on 28/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "EmployeeDetails.h"
#import "FirstVC.h"
#import "CoreData/CoreData.h"

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
            
            [emparr addObject:EmpDetails];
        }
    } return emparr;
}


//- (id)init
//{
//    self = [super init];
//    if (!self) return nil;
//
//    self.persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CoredataModel"];
//    [self.persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *description, NSError *error) {
//        if (error != nil) {
//            NSLog(@"Failed to load Core Data stack: %@", error);
//            abort();
//        }
//        callback();
//    }];
//
//    return self;
//}
//
@end
