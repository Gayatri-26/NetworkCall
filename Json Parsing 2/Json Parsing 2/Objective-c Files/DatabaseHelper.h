//
//  DatabaseHelper.h
//  Json Parsing 2
//
//  Created by Mac on 14/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Json_Parsing_2-Swift.h"

@class PersonDetail;
@class Person;
@interface DatabaseHelper : NSObject


@property (nonatomic,strong) AppDelegate *appDelegate;
@property( strong,nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic, readonly) NSPersistentContainer *persistentContainer;

+ (id)sharedInstance;

-(BOOL) saveData:(PersonDetail *) object;

@end

