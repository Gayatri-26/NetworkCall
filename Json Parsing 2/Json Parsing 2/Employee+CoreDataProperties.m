//
//  Employee+CoreDataProperties.m
//  Json Parsing 2
//
//  Created by Mac on 30/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//
//

#import "Employee+CoreDataProperties.h"

@implementation Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
}

@dynamic empId;
@dynamic name;
@dynamic salary;
@dynamic age;

@end
