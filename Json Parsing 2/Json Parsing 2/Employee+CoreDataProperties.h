//
//  Employee+CoreDataProperties.h
//  Json Parsing 2
//
//  Created by Mac on 30/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//
//

#import "Employee+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *empId;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *salary;
@property (nullable, nonatomic, copy) NSString *age;

@end

NS_ASSUME_NONNULL_END
