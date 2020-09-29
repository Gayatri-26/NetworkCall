//
//  DatabaseHelper.m
//  Json Parsing 2
//
//  Created by Mac on 14/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "DatabaseHelper.h"
#import <CoreData/CoreData.h>
#import "Json_Parsing_2-Swift.h"
#import "PersonDetail.h"
#import "Person+CoreDataClass.h"

@interface DatabaseHelper ()

@end

@implementation DatabaseHelper

@synthesize appDelegate, persistentContainer, managedObjectContext;

+ (id)sharedInstance {
    static DatabaseHelper *sharedInstance = nil;
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


-(void) saveData:(Person *) object{
    
   // Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[self managedObjectContext]];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    
    Person *person = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:[self managedObjectContext]];

    
    person.name = object.name;
    person.id = object.id;
    person.email = object.email;
    person.gender = object.gender;
    person.address = object.address;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Identifier == %@",object];
    [request setPredicate:predicate];
  //  Person *obj = [managedObjectContext executeRequest:request error:nil];
    
 //   AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSError *error = nil;
    if ([[self managedObjectContext] save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
        
    }
    
}

@end
