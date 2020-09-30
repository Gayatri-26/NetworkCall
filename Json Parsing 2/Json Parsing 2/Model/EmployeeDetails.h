//
//  EmployeeDetails.h
//  Json Parsing 2
//
//  Created by Mac on 28/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeDetails : NSObject

@property (nonatomic,strong) NSString *empId;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *salary;
@property (nonatomic,strong) NSString *age;

+(NSMutableArray < EmployeeDetails *> *)modelArrayFromDict:(NSDictionary *) d;

@end
 

