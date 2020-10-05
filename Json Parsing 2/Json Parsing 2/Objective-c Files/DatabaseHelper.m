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

    -(void) saveData:(Person *) object{
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[self managedObjectContext]];


   NSError *error = nil;

    person.pid = object.pid;
    person.name = object.name;
    person.email = object.email;
    person.gender = object.gender;
    person.address = object.address;

//
//    person.pid  = [dict objectForKey:@"id"];
//    person.name = [dict objectForKey:@"name"];
//    person.email = [dict objectForKey:@"email"];
//    person.address = [dict objectForKey:@"address"];
//    person.gender = [dict objectForKey:@"gender"];



        if ([[self managedObjectContext] save:&error] == NO)
        {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
        }

}

@end


