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


-(BOOL) saveData:(PersonDetail *) object{
    
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[self managedObjectContext]];
     NSFetchRequest *request = [[NSFetchRequest alloc] init];
     NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext: [self managedObjectContext]];
 //   NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    [request setEntity:entity];
    [request setPredicate:[NSPredicate predicateWithFormat:@"pid == %@", object.pid]];
    [request setFetchLimit:1];
    

    NSError *error = nil;
    NSUInteger count = [[self managedObjectContext] countForFetchRequest:request error:&error];

  
    person.name = object.name;
    person.pid = object.pid;
    person.email = object.email;
    person.gender = object.gender;
    person.address = object.address;
    
        if ([[self managedObjectContext] save:&error] == NO)
        {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
        }
    if (count)
      {
          return YES;
      }
      else
      {
          return NO;
      }
}

@end


