//
//  DataBase.m
//  Json Parsing 2
//
//  Created by Mac on 30/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "DataBase.h"
#import <CoreData/CoreData.h>
#import "Json_Parsing_2-Swift.h"
#import "Employee+CoreDataClass.h"

@implementation DataBase

@synthesize appDelegate, persistentContainer;

+ (id)sharedInstance {
    static DataBase *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (AppDelegate *)appDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication]delegate];
}

- (NSManagedObjectContext *)managedObjectContext{
    return [[self appDelegate] persistentContainer].viewContext;
}

-(NSArray *) getEmployeedb {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    NSArray *result  = [self.managedObjectContext executeFetchRequest: request error:nil];
//     NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@",result];
//    NSArray *filterarr = [result filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name = %@",request]];
//    [request setPredicate:predicate];
//    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:result];
//    NSArray *arrayWithoutDuplicates = [orderedSet array];
    
    return result;
    
//    https://stackoverflow.com/questions/18262003/handling-duplicate-entries-in-core-data
//   https://stackoverflow.com/questions/1025674/the-best-way-to-remove-duplicate-values-from-nsmutablearray-in-objective-c
}

-(void) saveData:(NSDictionary *) object{
    
    Employee *employee = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:[self managedObjectContext]];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@",employee.name];

    NSError *error = nil;
    
    employee.name = [object objectForKey:@"employee_name"];
    employee.empId = [object objectForKey:@"id"];
    employee.age = [object objectForKey:@"employee_age"];
    employee.salary = [object objectForKey:@"employee_salary"];
    
    if ([[self managedObjectContext] save:&error] == NO)
    {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    
}

@end
