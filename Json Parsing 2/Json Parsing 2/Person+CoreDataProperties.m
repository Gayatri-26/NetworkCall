//
//  Person+CoreDataProperties.m
//  Json Parsing 2
//
//  Created by Mac on 25/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Person"];
}

@dynamic address;
@dynamic email;
@dynamic gender;
@dynamic id;
@dynamic name;

@end
