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
#import "Person.h"

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
    
 Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[self managedObjectContext]];

    person.Pname = object.Pname;
    person.Pid = object.Pid;
    person.Pemail = object.Pemail;
    person.Pgender = object.Pgender;
    person.Paddress = object.Paddress;


          NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
           
          NSError *error = nil;
          NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
          if (!results) {
              NSLog(@"Error fetching Person objects: %@\n%@", [error localizedDescription], [error userInfo]);
              abort();
          }
      }


// AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
//      NSError *error = nil;
//      if ([[self mcontext] save:&error] == NO) {
//          NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
          


//    UIApplication *application = [UIApplication sharedApplication];
//
//    NSManagedObjectContext *context = (AppDelegate*)(application.delegate).
//                                       persistentContainer.viewContext;
//
    

@end
