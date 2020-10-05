//
//  Person+CoreDataProperties.h
//  Json Parsing 2
//
//  Created by Mac on 25/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//
//

#import "Person+CoreDataClass.h"


@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *address;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *gender;
@property (nullable, nonatomic, copy) NSString *pid;
@property (nullable, nonatomic, copy) NSString *name;

@end


