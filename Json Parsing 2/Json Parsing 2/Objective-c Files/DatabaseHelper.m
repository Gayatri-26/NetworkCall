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


-(BOOL) saveData:(Person *) object{
    
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[self managedObjectContext]];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    [request setEntity:person];
    [request setPredicate:[NSPredicate predicateWithFormat:@"person.id == object.id ",person.id,object.id]];
    [request setFetchLimit:1];

    NSError *error = nil;
    NSUInteger count = [managedObjectContext countForFetchRequest:request error:&error];

    if (count)
    {
        return YES;
    }
    else
    {
        return NO;
    }

    person.name = object.name;
    person.id = object.id;
    person.email = object.email;
    person.gender = object.gender;
    person.address = object.address;
    
   
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if ([[self managedObjectContext] save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
        
    }
    
}

@end
