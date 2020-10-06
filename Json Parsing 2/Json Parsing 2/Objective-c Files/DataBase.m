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
    
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Employee" inManagedObjectContext: [self managedObjectContext]];
//    NSFetchRequest *request = [[NSFetchRequest alloc]init];
//    [request setEntity:entity];
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"Employee" ascending:NO];
//    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
//    [request setSortDescriptors:sortDescriptors];
//    NSArray *result  = [self.managedObjectContext executeFetchRequest: request error:nil];
//
//    if (!result){
//    request.predicate = [NSPredicate predicateWithFormat:@"name = %@",result];
//
//    }
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    NSArray *result  = [self.managedObjectContext executeFetchRequest: request error:nil];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Employee" inManagedObjectContext: [self managedObjectContext]];
//    [request setEntity:entity];

//   request.predicate = [NSPredicate predicateWithFormat:@"name = %@",result];
    
//    NSArray *filterarr = [result filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name = %@",result]];
    
//    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:result];
//    NSArray *arrayWithoutDuplicates = [orderedSet array];
    
    return result;
    
//    https://stackoverflow.com/questions/18262003/handling-duplicate-entries-in-core-data
//   https://stackoverflow.com/questions/1025674/the-best-way-to-remove-duplicate-values-from-nsmutablearray-in-objective-c
//    https://code.tutsplus.com/tutorials/core-data-and-swift-batch-deletes--cms-25380
//    https://developer.apple.com/forums/thread/659382
//    https://stackoverflow.com/questions/15239407/is-there-any-way-we-can-restrict-duplicate-entries-in-core-data
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
