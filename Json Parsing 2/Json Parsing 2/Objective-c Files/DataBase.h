//
//  DataBase.h
//  Json Parsing 2
//
//  Created by Mac on 30/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Json_Parsing_2-Swift.h"
#import "FirstVC.h"

@class EmployeeDetails;

@interface DataBase : NSObject
@property (nonatomic,strong) AppDelegate *appDelegate;
@property( strong,nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic, readonly) NSPersistentContainer *persistentContainer;

+ (id)sharedInstance;
-(void) saveData:(EmployeeDetails *) object;
-(NSArray *) getEmployeedb;

@end
