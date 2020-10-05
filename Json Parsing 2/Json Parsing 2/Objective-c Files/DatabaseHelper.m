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
#import "Person+CoreDataClass.h"
#import "SecondVC.h"

@interface DatabaseHelper ()

@end

@implementation DatabaseHelper

@synthesize appDelegate, persistentContainer;

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

    -(NSArray *) getPersondb {

    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    NSArray *result  = [self.managedObjectContext executeFetchRequest: request error:nil];
    return result;
}

    -(void) saveData:(NSDictionary *) object{
        
    Person *person = [NSEntityDescription insertNewObjectForEntityForName: @"Person" inManagedObjectContext: [self managedObjectContext]];

    person.pid  = [object objectForKey:@"id"];
    person.name = [object objectForKey:@"name"];
    person.email = [object objectForKey:@"email"];
    person.address = [object objectForKey:@"address"];
    person.gender = [object objectForKey:@"gender"];


        NSError *error = nil;

        if ([[self managedObjectContext] save:&error] == NO)
        {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
        }

   }

@end


