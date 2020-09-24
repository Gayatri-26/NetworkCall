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

@interface DatabaseHelper ()



@end

@implementation DatabaseHelper

@synthesize appDelegate, persistentContainer, moc;

+ (id)sharedInstance {
    static DatabaseHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

//- (id)init {
//  if (self = [super init]) {
//      someProperty = [[NSString alloc] initWithString:@"Default Property Value"];
//  }
//  return self;
//}


//  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
  
- (AppDelegate *)appDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication]delegate];

}

- (NSManagedObjectContext *)moc{
//    return AppDelegate.persistentContainer.viewContext;
    return moc;
}

-(void) save:(PersonDetail *) object{
    
 PersonDetail *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[self moc]];

    person.Pname = object.Pname;
    person.Pid = object.Pid;
    person.Pemail = object.Pemail;
    person.Pgender = object.Pgender;
    person.Paddress = object.Paddress;

//
//      NSError *error = nil;
//      if ([[self mcontext] save:&error] == NO) {
//          NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
          

          NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
           
          NSError *error = nil;
          NSArray *results = [moc executeFetchRequest:request error:&error];
          if (!results) {
              NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
              abort();
          }
      }


//    UIApplication *application = [UIApplication sharedApplication];
//
//    NSManagedObjectContext *context = (AppDelegate*)(application.delegate).
//                                       persistentContainer.viewContext;
//
    

@end
