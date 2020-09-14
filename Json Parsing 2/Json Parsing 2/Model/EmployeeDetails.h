//
//  EmployeeDetails.h
//  Json Parsing 2
//
//  Created by Mac on 28/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeDetails : NSObject

@property (nonatomic,strong) NSString *EmpId;
@property (nonatomic,strong) NSString *Name;
@property (nonatomic,strong) NSString *Salary;
@property (nonatomic,strong) NSString *Age;

+(NSMutableArray < EmployeeDetails *> *)modelArrayFromDict:(NSDictionary *) d;

// @property (strong, nonatomic, readonly) NSPersistentContainer *persistentContainer;

@end
 

