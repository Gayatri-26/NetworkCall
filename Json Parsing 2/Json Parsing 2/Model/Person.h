//
//  Person.h
//  Json Parsing 2
//
//  Created by Mac on 24/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic,strong) NSString *Pid;
@property (nonatomic,strong) NSString *Pname;
@property (nonatomic,strong) NSString *Pemail;
@property (nonatomic,strong) NSString *Paddress;
@property (nonatomic,strong) NSString *Pgender;

+(NSMutableArray < Person *> *)modelArrayFromDict1:(NSDictionary *) d1;

@end


